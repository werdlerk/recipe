class CreateNecessities < ActiveRecord::Migration
  def change
    create_table :necessities do |t|
      t.integer :amount, null: false
      t.integer :unit_id, null: false
      t.integer :ingredient_id, null: false
      t.integer :recipe_id, null: false
      t.timestamps
    end
  end
end
