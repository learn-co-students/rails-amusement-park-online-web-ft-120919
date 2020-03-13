Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users
  resource :rides 

  get '/attractions', to: 'attractions#index', as: :attractions
  get '/attractions/new', to: 'attractions#new', as: :new_attractions
  post '/attractions', to: 'attractions#create'
  get '/attractions/:id', to: 'attractions#show', as: :attraction
  patch '/attractions/:id', to: 'attractions#update'
  get '/attractions/:id/edit', to: 'attractions#edit', as: :edit_attraction
  get '/users/:id', to: 'users#show', as: :user
  get '/signin', to: 'sessions#new', as: :signin
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy', as: :logout

  root 'static#home' 

end
