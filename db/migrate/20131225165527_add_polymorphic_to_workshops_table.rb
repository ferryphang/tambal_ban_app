class AddPolymorphicToWorkshopsTable < ActiveRecord::Migration
  def change
  	add_column :workshops, :creator_id, :integer
  	add_column :workshops, :creator_type, :string
  end
end
