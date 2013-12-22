class Workshop < ActiveRecord::Base

	geocoded_by :address
	after_validation :geocode 


	validates :name, presence: true
	validates :address, presence: true	
	validates :about, presence:true

end
