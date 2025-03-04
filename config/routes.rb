Rails.application.routes.draw do
  devise_for :users
  root to: "drones#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "posts#index"
  resources :drones, only: [:new, :index, :show]
  resources :bookings, only: [:index]
end
