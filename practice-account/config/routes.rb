Rails.application.routes.draw do
  root 'top#index'

  # users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # sessions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  resources :users
end
