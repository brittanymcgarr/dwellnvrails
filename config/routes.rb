Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/contact'
  
  get 'static_pages/about'
  
  get 'static_pages/renobb'
  
  get 'static_pages/listings'

  root 'static_pages#home'
end