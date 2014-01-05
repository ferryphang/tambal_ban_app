class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update]
  before_action :authenticate_user!
  layout 'user'

  def index
    @workshops = current_user.workshops
  end
 
  def show
  end

  def new
    @workshop = current_user.workshops.new
  end

  def edit
  end

  def create
    @workshop = current_user.workshops.new(workshop_params)
    @workshop.build_location latitude: params[:lat], longitude: params[:lng]

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to @workshop, notice: 'Workshop was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def create_comment
    get_workshop
    @comment = Comment.build_from(@workshop, current_user.id, params[:body] )
    if @comment.save
    redirect_to root_path, notice: "Your comment submitted"
    end
  end
  
  def create_rating
    get_workshop
    @rating = current_user.ratings.new workshop_id: @workshop.id, value: params[:value]

    if @rating.save
      redirect_to root_path, notice: "Your rating submitted to #{@workshop.name}"
    else
      redirect_to root_path, notice: "Your rating failed to submit"
    end
  end  

  def update
    respond_to do |format|
      if @workshop.update(workshop_params)
        format.html { redirect_to @workshop, notice: 'Workshop was successfully updated.' }
      else
        format.html { render action: 'edit' }      
      end
    end
  end

  private
    def get_workshop
      @workshop = Workshop.find(params[:id])
    end

    def set_workshop
      @workshop = current_user.workshops.find(params[:id])
    end

    def workshop_params
      params[:workshop].permit(:name, :address, :about, :lat, :lng, :category_id)
    end
end
