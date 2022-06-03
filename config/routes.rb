Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/sessions', to: 'sessions#index'
  get '/sessions/:id', to: 'sessions#show'
end
