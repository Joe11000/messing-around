Rails.application.routes.draw do
#   # Where is this suppose to go?
#   class BlacklistConstraint
#   def initialize
#     @ips = Blacklist.retrieve_ips
#   end

#   def matches?(request)
#     @ips.include? request.remote_ip
#   end
# end
# resources :users, demigod: 'Achillies', constraints: BlacklistConstraint.new

concern :imageable do
  resources :images, only: :index, controller: :users, as: :user
end

defaults god: :kathulu do
  constraints ({id: /\d+/, remote_ip: /127.0.0.1/ }) do
    resources :chat, only: [:index]
    # resources :users, demigod: 'Achillies', constraints: {remote_ip: /127.0.0.1/}
    # resources :users, demigod: 'Achillies', defaults: {god: 'Kathulu'}, constraints: lambda { |req| !!(req.remote_ip.match '127.0.0.1') if Rails.env == 'development'}
    resources :users, demigod: 'Achillies', constraints: lambda { |req| !!(req.remote_ip.match '127.0.0.1') if Rails.env == 'development'}
    resources :dogs
    resources :sessions, only: [:create, :destroy]
    resources :adoption

    concerns :imageable
  end
end

  scope :admin do
    concerns :imageable
  end
    # concerns :imageable

  get '/users/error' => 'users#error'
  # root 'users#index'
  root 'users#new'




  get '/stories/:id' => redirect("/users/%{id}", status: 302)


  get '/bears' => 'users#bears'

  # created own url helpers
  direct :da_bears do
    "http://www.chicagobears.com"
  end

  direct :puppers do
    { controller: 'dogs', action: 'index', subdomain: 'www'}
  end


# German path_names
# scope(path_names: { new: 'neu', edit: 'bearbeiten' }) do
#   resources :categories, path: 'kategorien'
# end



# This will provide you with URLs such as /bob/articles/1 and will allow you to reference the username part of the path as params[:username] in controllers, helpers and views.
# scope ':username' do
#   resources :articles
# end


# get 'photos/:id', to: 'photos#show', defaults: { format: 'jpg' }
# get 'photos(/:id)', to: :display


# resources :photos do
#   member do
#     get 'preview'
#   end
#     get 'preview', on: :collection
# end

# The namespace scope will automatically add :as as well as :module and :path prefixes.
# namespace 'admin' do
#   resource :photos
# end
# # vs
# scope module: 'admin' do
#   resource :photos
# end
# # vs
# scope '/admin' do
#   resource :photos
# end



# match 'photos', to: 'photos#show', via: [:get, :post]
# match 'photos', to: 'photos#show', via: :all

# get '*a/foo/*b', to: 'test#index'


get 'photos/:id', to: 'photos#show', constraints: { id: /[A-Z]\d{5}/ }

# resources :videos, param: :identifier
# makes a route like /videos/:identifier/edit


  mount ActionCable.server => '/cable'



  resources :hands, except: :destroy, defaults: {size: 'large'}, constraints: { remote_ip: /127.0.0.1/, id: /\d+/}

end


# localhost:3000/rails/info/routes
#regex for finding routes and
