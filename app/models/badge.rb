class Badge < ActiveRecord::Base
  has_many :workshops

  has_many :user_badges
  has_many :users, through: :user_badges
  
  mount_uploader :picture, BadgePictureUploader
end