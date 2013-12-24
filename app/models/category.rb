class Category < ActiveRecord::Base
  belongs_to :brand , polymorphic: true
  mount_uploader :picture_marker, CategoryPictureMarkerUploader
end
