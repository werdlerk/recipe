class Unit < ActiveRecord::Base
  validates :name, :locale, presence: true
  has_many :necessities
end