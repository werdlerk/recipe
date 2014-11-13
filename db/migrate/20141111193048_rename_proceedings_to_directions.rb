class RenameProceedingsToDirections < ActiveRecord::Migration
  def change
    drop_table :proceedings

    create_table :directions do |t|
      t.string :description
      t.integer :cooking_recipe_id
      t.timestamps
    end
  end
end
