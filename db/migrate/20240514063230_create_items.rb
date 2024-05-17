class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :category_id, null: false 
      t.integer :condition_id, null: false
      t.integer :cost_delivery_id, null: false
      t.integer :region_delivery_id, null: false
      t.integer :date_delivery_id, null: false
      t.timestamps
    end
  end
end
