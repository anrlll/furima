class RenameCostDeliveryIdColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :cost_delivery_id, :costdelivery
  end
end
