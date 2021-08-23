Rails.application.routes.draw do
  get 'teachers/index'
  get 'teachers/new'
  get 'teachers/edit'
  get 'teachers/show'
  get 'teachers/dashboard'
  devise_for :users
  root to: 'pages#home'
  resources :teachers
  get '/dashboard', to: 'teachers#dashboard'
end
