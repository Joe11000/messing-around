Rails.application.routes.draw do
  resources :users
  resources :dogs
  root 'users#index'
  resources :session, only: [:new, :create, :destroy]
  resources :adoption
end
