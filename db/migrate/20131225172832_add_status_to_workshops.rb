class AddStatusToWorkshops < ActiveRecord::Migration
  def change
  	add_column :workshops, :status, :boolean, default: true
  end
end
