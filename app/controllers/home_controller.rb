class HomeController < ApplicationController
	layout 'user'	
	def index
	end
	
	def search
		@user_location = get_user_location
		@locations = Location.includes(:workshop).nearby(@user_location, params[:category])
	end

	def show_direction
		@workshop = Workshop.find_by id: params[:id]
		@user_location = [params[:location].permit(:latitude)[:latitude], params[:location].permit(:longitude)[:longitude]]
		@workshops = Workshop.all
	end

	private 

		def get_user_location
			params[:user_location].split(',')
		end	
end
