class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :cart_creation

  def cart_creation
    puts "hello"
    Cart.create(
      user_id: User.last.id
    )
  end

  
  has_one :cart


end
