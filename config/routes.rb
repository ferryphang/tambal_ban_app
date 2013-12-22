LastProject::Application.routes.draw do

  devise_for :admins
  root 'home#index'

  resources 'home' do 
  	collection do
  		get 'search'
		end

		member do 
			post 'show_direction'
		end
	end
	
	resources 'workshops'
end
