class Item < ApplicationRecord
  
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true

  has_many :list_items
  has_many :carts, through: :list_items

end
