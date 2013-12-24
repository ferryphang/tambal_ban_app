class Workshop < ActiveRecord::Base
  has_one :location, as: :place, dependent: :destroy
  has_one :category, as: :brand
	
  validates :name, presence: true
	validates :address, presence: true	
	validates :about, presence:true

end
