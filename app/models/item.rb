class Item < ApplicationRecord
  has_one_attached :image
  
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates_attachment :image, presence: true,
                       content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
                       size: { less_than: 5.megabytes}
  has_attached_file :image, styles: { medium: "320x240"}

  has_many :list_items
  has_many :carts, through: :list_items

  has_many :list_orders
  has_many :orders, through: :list_orders

end
