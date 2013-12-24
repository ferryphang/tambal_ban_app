LastProject::Application.routes.draw do

  get "category/index"
  get "category/new"
  get "category/edit"
  devise_for :admins
  root 'home#index'

  resources 'home' do 
  	collection do
  		post 'search'
		end

		member do 
			post 'show_direction'
		end
	end
	
	resources 'workshops'
end
