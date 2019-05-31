Rails.application.routes.draw do
  root 'top#index'

  # users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
end
