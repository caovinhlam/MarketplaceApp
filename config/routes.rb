Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # localhost:3000/sessions
  get '/sessions', to: 'sessions#index'
  # localhost:3000/sessions/id
  get '/sessions/:id', to: 'sessions#show'
  post  '/sessions', to: 'sessions#create'
end
