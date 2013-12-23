class BadgesController < ApplicationController
  # before_action :set_badge

  def index
    @badge = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.create(badge_params)
    respond_to do |format|
      if @badge.save
        format.html {redirect_to(badges_path)}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    # def set_badge
    #   @badge = Badge.find(params[:id])
    # end

    def badge_params
      params.require(:badge).permit(:name, :picture, :picture_cache)
    end
end
