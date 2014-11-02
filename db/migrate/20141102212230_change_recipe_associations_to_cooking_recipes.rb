class ChangeRecipeAssociationsToCookingRecipes < ActiveRecord::Migration
  def change
    change_table :proceedings do |t|
      t.rename :recipe_id, :cooking_recipe_id
    end

    change_table :necessities do |t|
      t.rename :recipe_id, :cooking_recipe_id
    end
  end
end
