class UsersController < ApplicationController
  def show
    puts "User show controller"
    @user = current_user
    # if !current_user
    #   redirect_to root
    # end
  end
end
