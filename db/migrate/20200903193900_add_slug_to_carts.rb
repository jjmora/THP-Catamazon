class AddSlugToCarts < ActiveRecord::Migration[5.2]
  def change
    extend FriendlyId
    friendly_id :title, use: :slugged
    add_column :carts, :slug, :string
    add_index :carts, :slug, unique: true
  end
end
