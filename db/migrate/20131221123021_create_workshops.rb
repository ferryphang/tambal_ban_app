class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.belongs_to :category
      t.string :name
      t.string :address
      t.text :about
      t.timestamps
    end
  end
end
