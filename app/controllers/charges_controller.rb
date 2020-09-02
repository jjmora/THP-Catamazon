class ChargesController < ApplicationController
  @@price = 0

  def new
    @price = params[:price].to_f
    @@price = @price
  end
  
  def create
    # Amount in cents
    @amount = @@price.to_i
  puts @amount
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    })

    @order = Order.create!(price: @@price, user_id: current_user.id )
    @current_cart = Cart.where(user_id: current_user.id)
    @current_cart_items = @current_cart.first.items

    @current_cart_items.each do |listorder|
      ListOrder.create!(order_id: @order.id, item_id: listorder.id)
    end

    redirect_to root_path
    puts "# "*30
    ListItem.where(cart_id: @current_cart.first.id).destroy_all
    puts "# "*30

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
