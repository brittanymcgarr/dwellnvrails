Rails.application.routes.draw do
  
  # Routes and aliases for static pages
  get  '/contact', to: 'static_pages#contact'
  
  get '/home', to: 'static_pages#home'
  
  get '/about', to: 'static_pages#about'
  
  get '/renobb', to: 'static_pages#renobb'
  
  get '/listings', to: 'static_pages#listings'

  # Root route
  root 'static_pages#home'

end