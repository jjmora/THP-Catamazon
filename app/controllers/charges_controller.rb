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
      currency: 'usd',
    })
  a = Order.create(price: @@price, user_id: current_user.id)
  redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
