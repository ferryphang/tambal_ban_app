class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :get_user, only: [:show, :profile]
	layout 'user'
	def show
	end

	def profile
		debugger
		if @user.update(get_param_avatar)
			redirect_to user_path
		end
	end

	private
		def get_user
			@user = current_user
		end

		def get_param_avatar
			params[:user].permit(:avatar)
		end
end
