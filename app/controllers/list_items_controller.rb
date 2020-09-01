class ListItemsController < ApplicationController
  def create
    @item_id = params[:item_id]

    @list_item = ListItem.new(cart_id: current_user.id, item_id: @item_id)
  end
  
  def update
  end

  def new
  end

  def destroy
  end
end
