class CreateCookingRecipes < ActiveRecord::Migration
  def change
    create_table :cooking_recipes do |t|
        t.string :name, null: false
        t.timestamps
    end
  end
end
