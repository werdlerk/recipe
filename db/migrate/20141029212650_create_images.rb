class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file
      t.string :imageable_type
      t.integer :imageable_id
      t.timestamps
    end
  end
end
