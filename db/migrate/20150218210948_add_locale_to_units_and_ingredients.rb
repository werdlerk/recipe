class AddLocaleToUnitsAndIngredients < ActiveRecord::Migration
  def change
    add_column :units, :locale, :string, before: :created_at
    add_column :ingredients, :locale, :string, before: :created_at
  end
end
