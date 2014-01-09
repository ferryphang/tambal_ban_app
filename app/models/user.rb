
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter 

  mount_uploader :avatar, AvatarUploader

  has_many :workshops, as: :creator

  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :name, presence: true, uniqueness: true

  def self.most_contributing
    User.all.map { |user| [user.workshops.size,user] }.sort().reverse().slice(0,3)
  end
end
