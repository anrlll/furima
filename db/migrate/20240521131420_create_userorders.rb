class CreateUserorders < ActiveRecord::Migration[7.0]
  def change
    create_table :userorders do |t|
      t.string :postcode, null:false
      t.integer :regiondelivery_id, null:false
      t.string :municipalities,null: false
      t.string :blocknumber,null: false
      t.string :buildingname
      t.string :telnumber,null: false

      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
