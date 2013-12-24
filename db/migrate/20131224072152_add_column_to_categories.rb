class AddColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :picture_marker, :string
  end
end
