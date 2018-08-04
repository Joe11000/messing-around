Rails.application.routes.draw do
  resources :users
  resources :dogs
  resources :session, only: [:new, :create, :destroy]
  resources :adoption
  root 'users#index'
end
