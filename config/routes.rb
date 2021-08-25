Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :teachers do
    get '/dashboard', to: 'teachers#dashboard'
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
end
