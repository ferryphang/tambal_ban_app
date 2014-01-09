class Admin::UsersController < Admin::AdministratorsController
  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(15)
  end

  def give_badges
    @user = User.find params[:id]
    @badges = Badge.all - @user.badges   
  end

  def save_badges   
    user = User.find_by id: params[:id]
    user.transaction do
      params[:badge].each do |badge|
        user.user_badges.create(badge_id: badge)
      end
    end
    # userbadges = user.user_badges.create(userbadges_params)
    # if userbadges.save 
    #   redirect_to admin_users_path, notice: "Success #{user.name} have gotten the badge"
    # else
    #   redirect_to admin_users_path, notice: "Sorry, #{user.name} didnot got the badge or maybe he gotten it"
    # end
  end

  def take_badges
    @user = User.find params[:id]
    @badges = @user.badges
  end

  def destroy_badges   
    user = User.find_by id: params[:id]
    user.transaction do
      params[:badge].each do |badge|
        temp = user.user_badges.find_by badge_id: badge
        temp.destroy
        tran_success = true
      end
    end

    if tran_success
      redirect_to admin_badges_path, notice: "Success, the badges have been given to #{@user.name}"
    else
      redirect_to admin_badges_path, notice: "Sorry, the badges didnot given to #{@user.name}"
    end
  end

end