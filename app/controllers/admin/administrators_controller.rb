class Admin::AdministratorsController < ApplicationController
	before_action :authenticate_admin!
	layout 'admin'
end
