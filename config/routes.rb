Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'static#login'
  get 'logout', to: 'users#logout'
  post 'login', to: 'users#index'

  resources :errands do
    get '/pickup', to: 'errands#editpickup'
    patch '/pickup', to: 'errands#pickup'
  end

  # get '/errands/pickup', to: 'errands#edit'
  # post '/errands/pickup', to: 'errands#pickup'

  resources :users
  resources :errands
  root to: 'static#welcome'
end

# , only: [:index, :show, :new, :create, :update, :destroy, :edit]
