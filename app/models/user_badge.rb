class UserBadge < ActiveRecord::Base
  belongs_to :user 
  belongs_to :badge 
  validates_uniqueness_of :badge_id, scope: [:user_id]
end
