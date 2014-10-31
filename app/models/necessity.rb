class Necessity < ActiveRecord::Base
  belongs_to :cooking_recipe

  belongs_to :unit
  belongs_to :ingredient
end