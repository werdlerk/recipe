class AddAuthorToCookingRecipe < ActiveRecord::Migration
  def change
    add_column :cooking_recipes, :user_id, :integer, after: :duration_mins
  end
end
