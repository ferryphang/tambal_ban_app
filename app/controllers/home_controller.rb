class HomeController < ApplicationController
	layout 'admin'	
	def index
	end
	
	def search
		@user_location = get_user_location
		@list_workshops = Location.near(@user_location,10)

	end

	def show_direction
		@workshop = Workshop.find_by id: params[:id]
		@user_location = [params[:location].permit(:latitude)[:latitude], params[:location].permit(:longitude)[:longitude]]
	end



	private 

		def get_user_location
			params[:user_location].split(',')
		end	
end
