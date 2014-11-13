class AddOrderToDirections < ActiveRecord::Migration
  def change
    add_column :directions, :order, :integer, before: :description
  end
end
