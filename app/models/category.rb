class Category < ActiveRecord::Base
	has_many :workshops

  mount_uploader :marker, MarkerUploader

end
