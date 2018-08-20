Rails.application.routes.draw do
  resources :chat, only: [:index]
  resources :users
  resources :dogs
  resources :sessions, only: [:create, :destroy]
  resources :adoption
  # root 'users#index'
  root 'users#new'

  mount ActionCable.server => '/cable'
end
