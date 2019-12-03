Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'static#login'
  get 'logout', to: 'users#logout'
  post 'login', to: 'users#index'

  resources :users
  resources :errands, only: [:index, :show, :new, :create, :update, :destroy, :edit]
  root to: 'static#welcome'
end
