class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	before_action :get_user, only: [:show, :edit, :update, :profile]
	layout 'user'
	
	def show
		@user_workshops = @user.workshops.page(params[:page]).per(15)
		@user_badges = @user.user_badges.includes(:badge)
	end

	def edit
		authorize! :update, @user
	end

	def update
		if @user.update(get_param)
			redirect_to user_path
		end
	end

	private

		def get_user
			@user = User.find_by id: params[:id]
		end

		def get_param
			params[:user].permit(:name, :avatar)
		end
end
