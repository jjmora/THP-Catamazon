class ChargesController < ApplicationController
  
  def create
    # Amount in cents
    @price = params[:price].to_f
    @amount = @price*100
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount.to_i,
      description: 'Rails Stripe customer',
      currency: 'eur'
    })

    order_creation
    list_order_creation
    list_item_destroy

    @current_cart = Cart.where(user_id: current_user.id)
    @current_cart_items = @current_cart.first.items

    user_order
    admin_email


    redirect_to root_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

private

  def order_creation
    @order = Order.create!(price: @price, user_id: current_user.id )
  end

  def user_order
    UserMailer.with(sum: @price).order_email(current_user).deliver_now
  end

  def admin_email
    AdminMailer.with(sum: @price, user_id: current_user.id ).passed_order.deliver_now
  end

  def list_order_creation
    @current_cart_items.each do |listorder|
      ListOrder.create!(order_id: @order.id, item_id: listorder.id)
    end
  end

  def list_item_destroy
    ListItem.where(cart_id: @current_cart.first.id).destroy_all
  end


end
