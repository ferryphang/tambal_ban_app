class Category < ActiveRecord::Base
  mount_uploader :category_picture_marker, CategoryPictureMarkerUploader
end
