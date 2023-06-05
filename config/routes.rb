Rails.application.routes.draw do
  devise_for :users
  root to: "spaceships#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :spaceships do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:update]
#   /	GET	pages	home
# /spaceships	GET	spaceships	index
# /spaceship/:id	GET	spaceships	show
# /spaceships/:spaceship_id/booking/new	GET	bookings	new
# /spaceships/:spaceship_id/booking	POST	bookings	create
# /bookings/:id	PATCH	bookings	update
# /spaceships/new	GET	spaceships	new
# /spaceships	POST	spaceships	create
# /spaceships/:id	PATCH	spaceships	update
# /spaceships/:id	DELETE	spaceships	destroy
end
