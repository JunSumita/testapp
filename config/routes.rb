Rails.application.routes.draw do
  resources :categories
  devise_for :log_users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }

  #resources :log_users

  resources :users do
      root 'users#index'
      get 'users/show'
      post 'users/create'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
