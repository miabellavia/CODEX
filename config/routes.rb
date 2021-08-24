Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :teachers do
    get '/dashboard', to: 'teachers#dashboard'
  end
end
