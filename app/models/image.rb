class Image < ActiveRecord::Base
  include CarrierWave::MiniMagick

  belongs_to :imageable, polymorphic: true

  mount_uploader :file, ImageUploader
end