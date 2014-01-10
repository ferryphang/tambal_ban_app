class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	before_action :get_user, only: [:show, :edit, :update, :profile]
	layout 'user'
	
	def show

		@user_workshops = @user.workshops.page(params[:page]).per(15)
		@user_badges = @user.user_badges
		
	end

	def edit
		authorize! :update, @user
	end

	def update
		updated = unless needs_password?(@user, get_param)
			@user.update_without_password(get_param)
		else
			@user.update(get_param)
		end

		if updated
      sign_in @user, :bypass => true
			redirect_to user_path, :flash => { success: 'User profile successfully updated.' }
		else
			redirect_to user_path, :flash => { warning: 'User failed to update.' }
		end
	end

	private

		def get_user
			@user = User.find_by id: params[:id]
		end

		def get_param
			params[:user].permit(:name, :avatar, :password, :password_confirmation)
		end

		def needs_password?(user, params)
	    params[:email].present? || params[:password].present? || params[:current_password]
	  end
end
