Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'users#new'
  # get '/users/new' => 'users#new'
  # post '/users' => 'users#create'
  # get '/users/:id' => 'users#show', as: 'user'
  # get '/secrets' => 'secrets#show'
  resources :users, only: [:new, :create] 
  get '/user/:id', to: 'users#show', as: 'user'
end
