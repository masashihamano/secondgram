Rails.application.routes.draw do

  get 'comments/new'
  root 'pages#index'
  get 'sessions/new'
  get 'pages/help'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources 'users'
  resources 'topics'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'

  resources 'comments'

end
