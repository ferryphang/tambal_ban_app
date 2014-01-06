class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :get_user, only: [:show, :edit, :update, :profile]
	layout 'user'
	
	def show
	end

	def edit
	end

	def update
		if @user.update(get_param)
			redirect_to user_path
		end
	end

	private
		def get_user
			@user = current_user
		end

		def get_param
			params[:user].permit(:name, :avatar)
		end
end
