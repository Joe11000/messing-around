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


  resources :chat, only: [:index]
  # resources :users, demigod: 'Achillies', constraints: {remote_ip: /127.0.0.1/}
  resources :users, demigod: 'Achillies', constraints: lambda { |req| !!(req.remote_ip.match '127.0.0.1') if Rails.env == 'development'}
  resources :dogs
  resources :sessions, only: [:create, :destroy]
  resources :adoption

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
  {controller: 'dogs', action: 'index', subdomain: 'www'}
end



# get 'photos/:id', to: 'photos#show', defaults: { format: 'jpg' }
# get 'photos(/:id)', to: :display


# resources :photos do
#   member do
#     get 'preview'
#   end
    # get 'preview', on: :collection
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



  mount ActionCable.server => '/cable'


end


