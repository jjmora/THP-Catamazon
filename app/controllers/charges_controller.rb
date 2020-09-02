class ChargesController < ApplicationController
  @@price = 0
  
  def create
    # Amount in cents
    @price = params[:price].to_f
    puts "/"*150
    puts @price
    puts "/"*150
    @amount = @price*100
    puts "$"*150
    puts @amount.to_i
    puts "$"*150
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount.to_i,
      description: 'Rails Stripe customer',
      currency: 'usd'
    })

    @order = Order.create!(price: @price, user_id: current_user.id )
    @current_cart = Cart.where(user_id: current_user.id)
    @current_cart_items = @current_cart.first.items


    UserMailer.order_email(current_user).deliver_now

    @current_cart_items.each do |listorder|
      ListOrder.create!(order_id: @order.id, item_id: listorder.id)
    end

    redirect_to root_path
    
    
    ListItem.where(cart_id: @current_cart.first.id).destroy_all

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
