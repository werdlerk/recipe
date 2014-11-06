class RemoveNullContraintsNecessities < ActiveRecord::Migration
  def change
    change_column_null :necessities, :amount, true
    change_column_null :necessities, :unit_id, true
    change_column_null :necessities, :ingredient_id, true
    change_column_null :necessities, :cooking_recipe_id, true
  end
end
