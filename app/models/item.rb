class Item < ApplicationRecord
  has_one_attached :image
  
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true

  has_many :list_items
  has_many :carts, through: :list_items

  has_many :list_orders
  has_many :orders, through: :list_orders

end
