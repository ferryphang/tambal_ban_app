class UsersController < ApplicationController
	before_action :authenticate_users!
	before_action :get_user[:show]

	def show	
	end

	def profile
	end

	private
		def get_user
			@user = current_user.id
		end
end
