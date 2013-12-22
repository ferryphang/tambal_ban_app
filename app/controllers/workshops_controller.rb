class WorkshopsController < ApplicationController
	layout 'admin'
	before_action :authenticate_admin!
	before_action :get_workshop, only: [:show]
	def index 
		@workshops = Workshop.all
	end

	def new 
		@workshop = Workshop.new
	end

	def create
		@workshop = Workshop.new(set_params)
		if @workshop.save
			redirect_to workshops_path, notice: "New Workshop successfully created"
		else
			redirect_to workshops_path, alert: "New Workshop failed"
		end
	end

	def show
	end

	private
		def set_params
			params[:workshop].permit(:name, :address, :about)
		end

		def get_workshop
			@workshop = Workshop.find_by id: params[:id]
		end
end
