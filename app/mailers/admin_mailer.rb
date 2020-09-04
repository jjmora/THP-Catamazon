class AdminMailer < ApplicationMailer
  default from: 'catmazon@yopmail.com'

  def passed_order
    @sum = params[:sum]
    @user = User.find(params[:user_id]).email
    @admin = User.find_by(is_admin: true)
    @url  = 'https://thp-catmazon-prod.herokuapp.com/' 
    mail(to: @admin.email, subject: 'Une commande est passé, à toi la richesse!')

  end
end