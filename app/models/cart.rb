class Cart < ApplicationRecord
  has_one :user

  has_many :listitems
  has_many :items, through: :listitems
  
end
