class UsersController < ApplicationController
  def show
    puts "User show controller"
    #@user = current_user
    # if !current_user
    #   redirect_to root
    # end

    @user = User.find_by_id(params[:id])
  end
end
