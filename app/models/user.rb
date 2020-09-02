class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  # Defining relations
  has_one_attached :avatar
  has_one :cart
  has_many :orders

  after_create :cart_creation, :welcome_send

  validates :email, uniqueness: true

  def cart_creation
    puts "hello"
    puts email
    puts User.find_by(email: email).id
    
    Cart.create(
      user_id: User.find_by(email: email).id
    )
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


  
  


end
