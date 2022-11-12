Rails.application.routes.draw do
  get '/welcome/:name', to: 'welcome#show', as: 'welcome'
  get '/contacts', to: 'contacts#show'
  get '/team', to: 'team#show'
  resources :gossips
  resources :users, only: [:new, :create, :show]
  resources :cities, only: [:new, :create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'main#index'
end
