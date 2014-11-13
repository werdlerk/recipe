class RenameColumnOrderInDirections < ActiveRecord::Migration
  def change
    rename_column :directions, :order, :sort_order
  end
end
