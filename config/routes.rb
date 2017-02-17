Rails.application.routes.draw do
  # Password reset actions
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  # Routes and aliases for static pages
  get  '/contact', to: 'static_pages#contact'
  
  get '/home', to: 'static_pages#home'
  
  get '/about', to: 'static_pages#about'
  
  get '/renobb', to: 'static_pages#renobb'
  
  get '/listings', to: 'static_pages#listings'
  
  # Users management
  get '/signup', to: 'users#new'
  
  # Listings management
  get '/listings/new', to: 'listings#new'
  
  get '/listings/edit', to: 'listings#edit'
  
  # Session controller for Login/Logout
  get    '/login',   to: 'sessions#new'
  
  post   '/login',   to: 'sessions#create'
  
  delete '/logout',  to: 'sessions#destroy'

  # Root route
  root 'static_pages#home'
  
  # Resources
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :listings

end