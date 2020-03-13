Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static#home"
  get 'signin', to: 'sessions#new', as: 'sigin'
  resources :users
  
  resources :attractions
end
