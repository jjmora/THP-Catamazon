class OrderController < ApplicationController
  def create   
    @order = Order.create!(price: @price, user_id: @user_id )
  end

  def update
  end

  def destroy
  end
end
