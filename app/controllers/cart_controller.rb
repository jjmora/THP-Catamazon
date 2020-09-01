class CartController < ApplicationController
  def create

  end
  
  def update
  end

  def new
  end

  def destroy
  end

  def show
    @id = params[:id]
    @lists = ListItem.all
  end

end
