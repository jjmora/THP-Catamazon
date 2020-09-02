class OrderController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @orders = Order.all
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
