Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :teachers do
    get '/dashboard', to: 'teachers#dashboard'
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index show edit update destroy]
end
