Rails.application.routes.draw do
  get '/user/:id', to: 'user#show', as: 'user'
  get '/gossip/:id', to: 'gossip#show', as: 'gossip'
  get '/welcome/:name', to: 'welcome#show', as: 'welcome'
  get '/contacts', to: 'contacts#show'
  get '/team', to: 'team#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'main#index'
end
