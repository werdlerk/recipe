class CookingRecipe < ActiveRecord::Base
  has_many :necessities, dependent: :destroy
  has_many :directions, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy

  belongs_to :user

  accepts_nested_attributes_for :necessities, allow_destroy: true
  accepts_nested_attributes_for :directions, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :description, :servings, :duration_mins, presence: true

  default_scope { order('lower(name)') }

end