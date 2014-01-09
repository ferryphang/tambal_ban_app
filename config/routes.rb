LastProject::Application.routes.draw do
  # USER
  root 'home#index'
  resources 'home' do 
    collection do
      post 'search'
    end
  end
  
  # ADMIN
  devise_for :admins
  namespace 'admin' do 
    resources 'categories'
    resources 'workshops'
    resources 'badges'
    resources 'users' do 
      member do     
         get 'give_badges'
         post 'save_badges'
         get 'take_badges'
         post 'destroy_badges'
      end
    end
  end

  # MEMBER
  devise_for :users
  resources 'users', only: [:show, :edit, :update]
  
  resources 'workshops', except: [:destroy] do
    member do
      post 'create_comment'
      post 'vote_up'
      post 'vote_down'
      get 'show_direction'
      
    end
    collection do 
      get 'all'
      post 'search'
    end
  end
    
end
