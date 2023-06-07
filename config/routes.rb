Rails.application.routes.draw do
  devise_for :users
  root to: "spaceships#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :spaceships do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: [:update]
  get "/profile", to: "pages#profile", as: :profile
  get "/bookings", to: "pages#booking", as: :bookings
end
