Rails.application.routes.draw do
  resources :users
  resources :attractions

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  post '/users/:id', to: 'users#show'

  root 'welcome#home'
end
