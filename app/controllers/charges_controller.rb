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

    # @price = params[:price]
    puts "# "*30
    puts "This is Charges Controller"
    puts "price: #{@@price}"
    puts "# "*30
    @order = Order.create!(price: @@price, user_id: current_user.id )
    @current_cart = Cart.where(user_id: current_user.id)
    @current_cart_items = @current_cart.first.items

    @current_cart_items.each do |listorder|
      ListOrder.create!(order_id: @order.id, item_id: listorder.id)
    end
    # redirect_to order_index_path
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
