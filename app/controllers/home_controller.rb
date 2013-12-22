class HomeController < ApplicationController
	layout 'admin'	
	def index
	end
	
	def search
		@user_location = [-6.131294899999999, 106.8538]
		@list_workshops = Workshop.near(@user_location,2)
	end

	def show_direction
		@workshop = Workshop.find_by id: params[:id]
		@user_location = [-6.131294899999999, 106.8538]
	end

	private 
		def get_user_location
			params[:workshop].permit(:user)
		end	
end
