Rails.application.routes.draw do
  resources :chat, only: [:index]
  resources :users, demigod: 'Achillies'
  resources :dogs
  resources :sessions, only: [:create, :destroy]
  resources :adoption

  get '/users/error' => 'users#error'
  # root 'users#index'
  root 'users#new'

  mount ActionCable.server => '/cable'
end
