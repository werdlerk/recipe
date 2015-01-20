class Ingredient < ActiveRecord::Base
  has_many :necessities
  has_many :images, as: :imageable

  validates :name, presence: true

  before_save :name_to_downcase


  private

  def name_to_downcase
    self.name = name.downcase
  end
end