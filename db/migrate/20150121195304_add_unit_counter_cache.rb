class AddUnitCounterCache < ActiveRecord::Migration

  def up
    add_column :units, :necessities_count, :integer, default: 0

    Unit.all.each do |unit|
      Unit.reset_counters(unit.id, :necessities)
    end
  end

  def down
    remove_column :units, :necessities_count, :integer
  end
end
