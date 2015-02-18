class AddLocaleToCookingRecipes < ActiveRecord::Migration
  def change
    add_column :cooking_recipes, :locale, :string, before: :created_at
  end
end
