class AdminMailer < ApplicationMailer
  default from: 'catmazon99@yopmail.com'

  def passed_order

    @admin = User.find_by(is_admin: true)
    @url  = 'http://monsite.fr/login' 
    mail(to: @admin.email, subject: 'Une commande est passé, à toi la richesse!')

  end
end