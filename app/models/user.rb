class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  after_create :cart_creation

  validates :email, uniqueness: true

  def cart_creation
    puts "hello"
    puts email
    puts User.find_by(email: email).id
     
    Cart.create(
      user_id: User.find_by(email: email).id
     )

  end

  
  


end
