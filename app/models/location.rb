class Location < ActiveRecord::Base
  belongs_to :workshop
  reverse_geocoded_by :latitude, :longitude

  def self.nearby(user,category)
  	near(user,10).select {|location| location.workshop.category_id == category.to_i && location.workshop.status == true }
  end
end
