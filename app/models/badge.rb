class Badge < ActiveRecord::Base
  has_many :workshops

  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy
  
  mount_uploader :picture, BadgePictureUploader
end