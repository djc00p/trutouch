Rails.application.routes.draw do
  root 'home#index'

  # Users
  resources :users, except: [:index, :new], path: '/profile', as: 'profile'
  get '/sign_up', to: 'users#new', as: 'sign_up'

  # User Activation
  get '/activation', to: 'users#activation', as: 'activation'

  # User Sign In and Out
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  # Navbar Links
  get '/our_services', to: 'our_services#index'
  get '/products_used', to: 'products_used#index'
  get '/portfolio', to: 'portfolio#index'
  get '/appointment', to: 'appointment#index'
  get '/contact_us', to: 'contact_us#index'
end
