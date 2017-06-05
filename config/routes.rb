Rails.application.routes.draw do
  devise_for :log_users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#index'

  get 'pages/show'

  resources :users
  resources :log_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
