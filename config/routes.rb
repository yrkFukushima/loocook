Rails.application.routes.draw do
  devise_for :users
  root to: "dishes#index"
  resources :dishes, only: [:new, :show, :create]
  resources :users, only: :show
end
