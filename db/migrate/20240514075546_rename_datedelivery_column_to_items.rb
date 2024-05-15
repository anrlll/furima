class RenameDatedeliveryColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :datedelivery, :datedelivery_id
  end
end
