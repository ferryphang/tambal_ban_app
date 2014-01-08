class Admin::BadgesController < Admin::AdministratorsController
  before_action :get_badge, set_only: [:edit, :destroy]
  before_action :authenticate_admin!

  def index
    @badges = Badge.all.page(params[:page]).per(5)
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.create(badge_params)
    respond_to do |format|
      if @badge.save
        format.html {redirect_to(badge_params)}
      end
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: 'Badge was successfully updated.' 
    else
      redirect_to admin_badges_path, notice: 'Badge accidentally failed.' 
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: "Badge successfully deleted"
  end

  private
    def badge_params
      params.require(:badge).permit(:name, :picture)
    end

    def get_badge
      @badge = Badge.find_by(id: params[:id])
    end
end
