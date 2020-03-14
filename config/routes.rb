Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static#home"
  get 'signin', to: 'sessions#new', as: 'signin'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  post 'take_ride', to: 'users#ride'
  resources :users
  resources :attractions
end
