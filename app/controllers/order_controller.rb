class OrderController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :check_if_admin
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end
  
  # def create   
  #   @price = params[:price]
  #   @order = Order.create!(price: @price, user_id: current_user.id )
  #   @current_cart = Cart.where(user_id: current_user.id)
  #   @current_cart_items = @current_cart.first.items

  #   @current_cart_items.each do |listorder|
  #     ListOrder.create!(order_id: @order.id, item_id: listorder.id)
  #   end
  #   redirect_to order_index_path
  # end

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
end
