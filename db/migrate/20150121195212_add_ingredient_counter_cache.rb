class AddIngredientCounterCache < ActiveRecord::Migration

  def up
    add_column :ingredients, :necessities_count, :integer, before: :created_at, default: 0

    Ingredient.all.each do |ingredient|
      Ingredient.reset_counters(ingredient.id, :necessities)
    end
  end

  def down
    remove_column :ingredients, :necessities_count, :integer
  end
end
