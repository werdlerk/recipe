class AddCookingRecipeProperties < ActiveRecord::Migration
  def change
    add_column :cooking_recipes, :servings, :integer, after: :description
    add_column :cooking_recipes, :duration_mins, :integer, after: :servings
  end
end
