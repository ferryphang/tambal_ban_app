class Location < ActiveRecord::Base
  belongs_to :place , polymorphic: true

  reverse_geocoded_by :latitude, :longitude
end
