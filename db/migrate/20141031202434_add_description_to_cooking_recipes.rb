class AddDescriptionToCookingRecipes < ActiveRecord::Migration
  def change
    add_column :cooking_recipes, :description, :text, after: :name
  end
end
