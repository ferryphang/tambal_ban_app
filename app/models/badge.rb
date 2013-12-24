class Badge < ActiveRecord::Base
  mount_uploader :picture, BadgePictureUploader
end
