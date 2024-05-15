class RenameRegionDeliveryIdColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :region_delivery_id, :regiondelivery
  end
end
