class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :postcode, null:false
      t.integer :regiondelivery_id, null:false
      t.string :municipalities,null: false
      t.string :blocknumber,null: false
      t.string :buildingname
      t.string :telnumber,null: false
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
