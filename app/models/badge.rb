class Badge < ActiveRecord::Base
  has_many :workshops
  mount_uploader :picture, BadgePictureUploader
end