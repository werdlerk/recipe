class CreateProceedings < ActiveRecord::Migration
  def change
    create_table :proceedings do |t|
      t.string :description, null: false
      t.integer :recipe_id
      t.timestamps
    end
  end
end
