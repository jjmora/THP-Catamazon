class UserMailer < ApplicationMailer
  default from: 'catmazon99@yopmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'http://monsite.fr/login' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end


  def order_email(current_user)
    puts "*"*150
    p current_user.email
    puts "*"*150
    @user = current_user
    @url  = 'http://monsite.fr/login' 
    mail(to: @user.email, subject: 'Votre commande a été passé !') 
  end
end

