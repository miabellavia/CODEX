Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :teachers
  get '/dashboard', to: 'teachers#dashboard'
end
