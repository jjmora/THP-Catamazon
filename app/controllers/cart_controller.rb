class CartController < ApplicationController

  def show
    @lists = ListItem.all
  end

end
