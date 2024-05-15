class RenameDateDeliveryIdColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :date_delivery_id, :datedelivery
  end
end
