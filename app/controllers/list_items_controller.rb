class ListItemsController < ApplicationController
  def create
    @item_id = params[:item_id]
    @cart_id = Cart.where(user_id: current_user.id).first.id
    puts @cart_id
    @list_item = ListItem.create!(cart_id: @cart_id, item_id: @item_id)
    puts " # "*20
    puts "New ListItem Created: cart_id: #{@cart_id} and item_id: #{@item_id}"
    puts " # "*20
    flash[:warning] = "The item was added to your cart"
    redirect_to cart_path(@cart_id)
  end
  
  def update
  end

  def new
  end

  def destroy
    puts "* "*30
    puts params[:cart_id]
    @cart_id = params[:cart_id]
    @list_item = ListItem.find(params[:id])
    @list_item.destroy
    flash[:danger] = "The item was deleted from your cart"
    puts "delete controller from ListsItem"
    puts @list_item.id
    puts "* "*30
    redirect_to cart_path(@cart_id)
  end
end
