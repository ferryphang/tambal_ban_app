class AddAddressToWorkshops < ActiveRecord::Migration
  def change
  	add_column :workshops, :address, :string
  end
end
