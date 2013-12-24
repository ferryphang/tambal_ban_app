LastProject::Application.routes.draw do
  root 'home#index'

  devise_for :admins
  resources 'badges'
  resources 'categories'
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
