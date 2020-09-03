class UsersController < ApplicationController
  before_action :check_user

  def show
    puts "User show controller"
    @user = User.find_by_id(params[:id])
    @orders = @user.orders
  end

  def check_user
    params_id = params[:id]
    if current_user.id.to_s != params_id
      redirect_to root_path
    end
  end
end
