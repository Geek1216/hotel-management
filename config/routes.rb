Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :bookings do
    member do
      get :destroy_popup
    end
    collection do
      get :room_type
      get :booking_with_guest
    end
  end
  resources :guests do
    member do
      get :destroy_popup
    end
  end
  resources :rooms do
    member do
      get :destroy_popup
    end
  end
  root "rooms#index"
end
