Rails.application.routes.draw do
  resources :users
  get 'dogs/adopt', to: 'dogs#adopt', as: :adopt_dogs
  resources :dogs
  root 'users#index'
  resources :session, only: [:new, :create, :destroy]
end
