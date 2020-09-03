class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to item_path(params[:id])
    end

  end
  
  def delete
    Item.find(params[:id]).destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:items).permit(:title, :description, :price, :image_url, :image)
  end
end
