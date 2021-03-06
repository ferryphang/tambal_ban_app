class Admin::WorkshopsController < Admin::AdministratorsController
	before_action :get_workshop, only: [:show, :destroy, :edit, :update]
	
	def index 
		@workshops = Workshop.all.page(params[:page]).per(15)
	end

	def new 
		@workshop = current_admin.workshops.new
	end

	def create
		@workshop = current_admin.workshops.new(set_params)
		@workshop.build_location latitude: params[:lat], longitude: params[:lng]

		if @workshop.save
			redirect_to admin_workshops_path, notice: "New Workshop successfully created"
		else
			redirect_to admin_workshops_path, alert: "New Workshop failed"
		end
	end

	def show
	end

	def edit
	end

	def update
    if @workshop.update(set_params)
      @workshop.location.update_attributes(latitude: params[:lat], longitude: params[:lng])
      redirect_to admin_workshops_path, notice: 'Workshop was successfully updated.' 
    else
      redirect_to admin_workshops_path, notice: 'Workshop accidentally failed.' 
   	end
  end

	def destroy
		@workshop.destroy
    redirect_to admin_workshops_path, notice: "Workshop successfully deleted"
	end

	private
		def set_params
			params[:workshop].permit(:name, :address, :about, :lat, :lng, :category_id, :status)
		end

		def get_workshop
			@workshop = Workshop.find_by id: params[:id]
		end
end
