class CookingRecipe < ActiveRecord::Base
  has_many :necessities
  has_many :proceedings
  has_many :pictures

  has_many :images, as: :imageable

  accepts_nested_attributes_for :necessities, allow_destroy: true
end