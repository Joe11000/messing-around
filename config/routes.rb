Rails.application.routes.draw do
  resources :users
  resources :dogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :session, only: [:new, :create, :destroy]
end
