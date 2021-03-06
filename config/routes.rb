Rails.application.routes.draw do
  devise_scope :user do
    match '/sessions/user', to: 'devise/sessions#create', via: :post
    # Redirects signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # localhost:3000/sessions
  devise_for :users
  get 'sessions', to: 'sessions#index'
  get 'sessions/my_session', to: 'sessions#my_session', as: 'my_session'
  get 'sessions/new', to: 'sessions#new'
  get 'sessions/:id', to: 'sessions#show', as: 'session'
  get 'sessions/:id/edit', to: 'sessions#edit', as: 'edit_session'
  
  get 'sessions/:id/link', to: 'sessions#link_session', as: 'link_session'
  patch 'sessions/:id', to: 'sessions#update'
  post 'sessions', to: 'sessions#create'
  delete 'sessions/:id', to: 'sessions#destroy'
  delete 'sessions/:id/link', to: 'sessions#unlink_session', as: 'unlink_session'

  root 'sessions#index'
end
