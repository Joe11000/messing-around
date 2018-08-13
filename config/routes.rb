Rails.application.routes.draw do
  resources :chat, only: [:index]
  resources :users
  resources :dogs
  resources :session, only: [:new, :create, :destroy]
  resources :adoption
  root 'users#index'

  mount ActionCable.server => '/cable'
end
