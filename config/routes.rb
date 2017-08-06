Rails.application.routes.draw do
  get 'welcome/index'
  resources :users do
    resources :posts do
      member do
        post :new
      end
    end
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', :controller => 'sessions', :action => 'destroy'

  root 'welcome#index'
end
