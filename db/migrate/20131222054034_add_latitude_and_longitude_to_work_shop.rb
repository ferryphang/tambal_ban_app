class AddLatitudeAndLongitudeToWorkShop < ActiveRecord::Migration
  def change
    add_column :workshops, :latitude, :float
    add_column :workshops, :longitude, :float
  end
end
