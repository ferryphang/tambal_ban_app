LastProject::Application.routes.draw do
  # USER
  root 'home#index'
  resources 'home' do 
    collection do
      post 'search'
    end
    member do 
      post 'show_direction'
    end
  end
  
  # ADMIN
  devise_for :admins
  namespace 'admin' do 
    resources 'categories'
    resources 'workshops'
    resources 'badges'
  end

  # MEMBER
  devise_for :users
  resources 'users', only: [:show] do
    member do
      patch 'profile'
    end
  end
  resources 'workshops', except: [:destroy] do
    member do
      post 'create_comment'
    end
  end
    
end
