Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resources :videos, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
