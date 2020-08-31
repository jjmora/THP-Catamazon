class Item < ApplicationRecord
  
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true

  has_many :listitems
  has_many :carts, through: :listitems

end
