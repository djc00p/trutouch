Rails.application.routes.draw do
  root 'home#index'

  get '/covid_19', to: 'covid_19#index'
  get '/our_services', to: 'our_services#index'
  get '/products_used', to: 'products_used#index'
  get '/portfolio', to: 'portfolio#index'
  get '/appointment', to: 'appointment#index'
  get '/contact_us', to: 'contact_us#index'
end
