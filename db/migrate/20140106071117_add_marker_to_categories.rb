class AddMarkerToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :marker, :string
  end
end
