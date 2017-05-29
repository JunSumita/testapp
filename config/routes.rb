Rails.application.routes.draw do
  devise_for :log_users
  root 'pages#index'

  get 'pages/show'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
