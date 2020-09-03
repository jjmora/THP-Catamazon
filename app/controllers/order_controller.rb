class OrderController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :check_if_admin
  
  def index
    @orders = Order.all
    @total_price = 0
    @orders.each do |x|
      @total_price += x.price
    end
    @a = @total_price/@orders.length
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end
  

  def update
  end

  def destroy
  end

  private

  def check_if_admin
    unless current_user.is_admin
      redirect_to root_path
    end
  end

  def average_cart

  end

end
