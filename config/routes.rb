Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'static#login'
  get 'goodbye', to: 'static#goodbye'
  get 'logout', to: 'users#logout'
  post 'login', to: 'users#index'

  resources :errands do
    get '/pickup', to: 'errands#editpickup'
    patch '/pickup', to: 'errands#pickup'

   resources :comments, only: [:new, :create]
    
  end 

  resources :comments do
    resources :replies, only: [:new, :create]
  end
    

  # resources :replies, only: [:new, :create, :update, :edit]

  resources :users
  resources :errands
  root to: 'static#welcome'
end

# , only: [:index, :show, :new, :create, :update, :destroy, :edit]
