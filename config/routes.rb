Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'static#login'
  get 'logout', to: 'users#logout'
  post 'login', to: 'users#index'

  resources :errands do
    get '/pickup', to: 'errands#editpickup'
    patch '/pickup', to: 'errands#pickup'

    resources :comments
    # get 'comments/new', to: 'comments#new'
    # post 'comments/new', to: 'comments#create'
  end

  # get '/errands/pickup', to: 'errands#edit'
  # post '/errands/pickup', to: 'errands#pickup'

  # resources :comments, only: [:new, :create, :update, :edit]
  # resources :replies, only: [:new, :create, :update, :edit]

  resources :users
  resources :errands, only: [:index, :show, :new, :create, :update, :destroy, :edit]
  root to: 'static#welcome'
end
