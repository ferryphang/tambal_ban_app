class HomeController < ApplicationController
	layout 'user'

	def index
		@badge = Badge.first
		@users = User.most_contributing
	end
	
	def search
		@user_location = get_user_location
		@locations = Location.includes(:workshop).nearby(@user_location, params[:category])		
	end

	private 

		def get_user_location
			params[:user_location].split(',')
		end	
end
