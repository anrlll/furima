class RenameRegiondeliveryIdColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :regiondelivery, :regiondelivery_id
  end
end
