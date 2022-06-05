Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # localhost:3000/sessions
  get 'sessions', to: 'sessions#index'
  # localhost:3000/sessions/new
  get 'sessions/new', to: 'sessions#new'
   # localhost:3000/sessions/id
  get 'sessions/:id', to: 'sessions#show', as: 'session'
  get 'sessions/:id/edit', to: 'sessions#edit', as: 'edit_session'
  patch 'sessions/:id', to: 'sessions#update'
  post 'sessions', to: 'sessions#create'

  root 'sessions#index'
end
