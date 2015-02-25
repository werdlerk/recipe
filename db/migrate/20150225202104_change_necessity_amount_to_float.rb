class ChangeNecessityAmountToFloat < ActiveRecord::Migration
  def change
    change_column :necessities, :amount, :float
  end
end
