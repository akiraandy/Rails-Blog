Rails.application.routes.draw do
  get 'welcome/index'
  resources :users, shallow: true do
    resources :posts do
      resources :comments
    end
  end
  get '/posts', to: 'posts#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', :controller => 'sessions', :action => 'destroy'

  root 'posts#index'
end
