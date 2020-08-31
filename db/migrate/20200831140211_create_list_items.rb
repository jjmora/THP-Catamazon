class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.references :cart, index:true
      t.references :item, index:true

      t.timestamps
    end
  end
end
