Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resources :videos, only: [:new, :create, :show]
  post '/youtube_redirect', to: 'videos#youtube_redirect'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  root :to => "videos#new"
end
