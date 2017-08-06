Rails.application.routes.draw do
  get 'welcome/index'
  resources :posts
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'welcome#index'
end
