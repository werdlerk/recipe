class CookingRecipe < ActiveRecord::Base
  has_many :necessities, dependent: :destroy
  has_many :directions, dependent: :destroy

  has_many :images, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :necessities, allow_destroy: true
  accepts_nested_attributes_for :directions, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
end