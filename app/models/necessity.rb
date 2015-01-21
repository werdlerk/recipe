class Necessity < ActiveRecord::Base
  # attr_accessor :unit_name, :ingredient_name

  belongs_to :cooking_recipe
  belongs_to :unit, counter_cache: true
  belongs_to :ingredient, counter_cache: true

  def unit_name
    unit.try(:name)
  end

  def unit_name=(name)
    self.unit = Unit.find_or_create_by(name: name) if name.present?
  end

  def ingredient_name
    ingredient.try(:name)
  end

  def ingredient_name=(name)
    self.ingredient = Ingredient.find_or_create_by(name: name) if name.present?
  end
end