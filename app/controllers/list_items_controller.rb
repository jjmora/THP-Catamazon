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
    redirect_to items_path
  end
  
  def update
  end

  def new
  end

  def destroy
  end
end
