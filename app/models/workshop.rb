class Workshop < ActiveRecord::Base
	acts_as_commentable
  acts_as_voteable
  
	has_one :location, dependent: :destroy
	belongs_to :category
	belongs_to :creator, polymorphic: true
	
  validates :name, presence: true
	validates :address, presence: true	
	validates :about, presence:true

  after_create :get_badge

  def self.full_search(string)
    Workshop.where("name LIKE '%#{string}%' OR address LIKE '%#{string}%' OR about LIKE '%#{string}%'")
  end

  private

    def get_badge
      debugger
      if creator.class == User
        if creator.workshops.count == 1 
          creator.user_badges.create(badge_id: 1)
        elsif creator.workshops.count == 2
          creator.user_badges.create(badge_id: 2)
        end
      end

    end

end
