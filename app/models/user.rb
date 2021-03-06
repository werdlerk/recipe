class User < ActiveRecord::Base
  has_secure_password
  has_many :cooking_recipes

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, length: {minimum: 8}, on: :create
  validates :name, presence: true
end
