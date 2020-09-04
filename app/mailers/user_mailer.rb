class UserMailer < ApplicationMailer
  default from: 'catmazon@yopmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://thp-catmazon-prod.herokuapp.com/' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end


  def order_email(current_user)
    @sum = params[:sum]
    @user = current_user
    @url  = 'https://thp-catmazon-prod.herokuapp.com/' 
    mail(to: @user.email, subject: 'Votre commande a été passé !') 
  end
end

