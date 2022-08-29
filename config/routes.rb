Rails.application.routes.draw do
  root "home#index"

  # Users
  resources :users, except: %i[index new], path: "/profile", as: "profile" do
    resources :vehicles, except: %i[new edit update], path: "my_vehicles", as: "my_vehicles", shallow: true
    get "/add_my_vehicle", to: "vehicles#new", as: "add_my_vehicle"
    resources :addresses, except: %i[index show edit update], shallow: true
    resources :appointments, except: %i[edit update destroy]
  end
  patch "/addresses/:id/confirm", to: "addresses#confirm", as: "confirm_address"

  get "/sign_up", to: "users#new", as: "sign_up"

  # User Activation
  get "/profile/:id/verification", to: "users#verification", as: "verification"
  patch "/profile/:id/verify", to: "users#verify", as: "verify"
  get "/thank_you", to: "thank_you#index", as: "thank_you"

  # User Sign In and Out
  get "/sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"
  delete "/sign_out", to: "sessions#destroy"

  # Navbar Links
  get "/our_services", to: "our_services#index"
  get "/products_used", to: "products_used#index"
  get "/portfolio", to: "portfolio#index"
  get "/appointment", to: "appointment#index"
  get "/contact_us", to: "contact_us#index"
end
