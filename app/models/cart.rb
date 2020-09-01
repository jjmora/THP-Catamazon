class Cart < ApplicationRecord
  belongs_to :user

  has_many :list_items
  has_many :items, through: :list_items

  validates :user_id, uniqueness: true
  
end
