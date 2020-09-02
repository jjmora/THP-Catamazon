class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    mail(from: "hello@catmazon.fr", to: user.email,
         subject: "Bienvenido on Catmazon")
  end
end
