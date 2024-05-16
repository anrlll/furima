class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :category_id, null: false 
      t.integer :condition_id, null: false
      t.integer :costdelivery_id, null: false
      t.integer :regiondelivery_id, null: false
      t.integer :datedelivery_id, null: false
      t.timestamps
    end
  end
end
