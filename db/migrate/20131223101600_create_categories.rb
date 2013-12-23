class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :picture_marker

      t.timestamps
    end
  end
end
