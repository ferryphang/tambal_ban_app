class Workshop < ActiveRecord::Base
	acts_as_commentable
  acts_as_voteable
  
	has_one :location, dependent: :destroy
	belongs_to :category
	belongs_to :creator, polymorphic: true
	
  validates :name, presence: true
	validates :address, presence: true	
	validates :about, presence:true

end
