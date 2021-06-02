Rails.application.routes.draw do
  devise_for :users
  root to: "dishes#index"
  resources :dishes, only: [:new, :show, :create] do
    collection do 
      get'about'
    end 
    collection do 
      get 'search'
    end  
  end   
  resources :users, only: :show

end
