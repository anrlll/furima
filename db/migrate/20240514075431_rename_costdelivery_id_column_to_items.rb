class RenameCostdeliveryIdColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :costdelivery, :costdelivery_id
  end
end
