class Ingredient < ActiveRecord::Base
  has_many :necessities
  has_many :images, as: :imageable
end