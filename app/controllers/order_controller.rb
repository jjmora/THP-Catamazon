class OrderController < ApplicationController
  
  def index
    @orders = Order.all
    @items = 
    puts " # "*30
    puts Order.first.items_ordered
    puts " # "*30
  end
  
  def create   
    @order = Order.create!(price: @price, user_id: current_user.id )
  end

  def update
  end

  def destroy
  end
end
