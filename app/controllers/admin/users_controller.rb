class Admin::UsersController < Admin::AdministratorsController
  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(15)
  end

  def give_badges
    @badges = Badge.all
    @user = User.find params[:id]
  end

  def save_badges
   
    user = User.find_by id: params[:id]
    userbadges = user.user_badges.create(userbadges_params)
    if userbadges.save 
      redirect_to admin_users_path, notice: "Success #{user.name} have gotten the badge"
    else
      redirect_to admin_users_path, notice: "Sorry, #{user.name} didnot got the badge or maybe he gotten it"
    end
  end

  private
    def userbadges_params
      params.require(:userbadges).permit(:badge_id)
    end
end
