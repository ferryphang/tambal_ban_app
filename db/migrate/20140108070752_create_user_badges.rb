class CreateUserBadges < ActiveRecord::Migration
  def change
    create_table :user_badges do |t|
      t.string :user_id
      t.string :badge_id

      t.timestamps
    end
  end
end
