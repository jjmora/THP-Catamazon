class Order < ApplicationRecord
  belongs_to :user

  has_may :list_orders
  has_many :items, through: :list_orders
end
