class Category < ActiveRecord::Base
  mount_uploader :picture_marker, CategoryPictureMarkerUploader
end
