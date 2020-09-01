class OrderController < ApplicationController
  
  def index
    @orders = Order.all
    puts Order.first.items_ordered

  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end
  
  def create   
    @price = params[:price]
    @order = Order.create!(price: @price, user_id: current_user.id )

    redirect_to order_index_path
  end

  def update
  end

  def destroy
  end
end
