class CookingRecipe < ActiveRecord::Base
  has_many :necessities
  has_many :directions
  has_many :pictures

  has_many :images, as: :imageable

  accepts_nested_attributes_for :necessities, allow_destroy: true
  accepts_nested_attributes_for :directions, allow_destroy: true
end