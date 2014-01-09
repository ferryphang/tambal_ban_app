class WorkshopsController < ApplicationController
  before_action :get_user_workshops, only: [:edit, :update]
  before_action :get_workshop, only: [:vote_up, :vote_down, :create_comment, :show_direction, :show]
  before_action :authenticate_user!, except: [:show_direction, :show, :all, :search]
  layout 'user'

  def index
    @workshops = current_user.workshops
  end

  def all
    @workshops = Workshop.all.page(params[:page]).per(15)
  end
 
  def show
  end

  def new
    @workshop = current_user.workshops.new
  end

  def edit
    authorize! :update, @workshop
  end

  def create
    @workshop = current_user.workshops.new(workshop_params)
    @workshop.build_location latitude: params[:lat], longitude: params[:lng]

      if @workshop.save
        redirect_to @workshop, :flash => { success: 'Workshop was successfully created.' }
      # else
      #   format.html { render action: 'new' }
      end
  end

  def update
    authorize! :update, @workshop
    respond_to do |format|
      if @workshop.update(workshop_params)
        format.html { redirect_to @workshop, success: 'Workshop was successfully updated.' }
      else
        format.html { render action: 'edit' }      
      end
    end
  end

  # CUSTOM ROUTES
  def create_comment
    @comment = Comment.build_from(@workshop, current_user.id, params[:body] )
    if @comment.save
      redirect_to show_direction_workshop_path(@workshop.id), :flash => { success: "Your comment submitted" }
    end
  end

  def vote_up
    if current_user.vote_for(@workshop)
      redirect_to show_direction_workshop_path(@workshop.id), :flash => { success: "You liked this #{@workshop.name}" }
    end

  rescue
    redirect_to show_direction_workshop_path(@workshop.id), :flash => { error: "You have voted this #{@workshop.name}" }
  end

  def vote_down
    if current_user.vote_against(@workshop)
      redirect_to show_direction_workshop_path(@workshop.id), :flash => { success: "You unliked this #{@workshop.name}" }
    end

    rescue
      redirect_to show_direction_workshop_path(@workshop.id), :flash => { error: "You have voted this #{@workshop.name}" }
  end

  def show_direction
    @workshops = Workshop.all
    @comments = @workshop.comment_threads.page(params[:page]).per(15)
  end

  def search
    @workshops = Workshop.full_search(params[:search])
  end

  private
    def get_workshop
      @workshop = Workshop.find_by id: params[:id]
    end


    def get_user_workshops
      @workshop = current_user.workshops.find(params[:id])
    end

    def workshop_params
      params[:workshop].permit(:name, :address, :about, :lat, :lng, :category_id)
    end
end
