class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :workshop
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
