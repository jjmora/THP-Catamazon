class Item < ApplicationRecord
  
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true

end
