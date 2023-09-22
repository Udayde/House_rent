Rails.application.routes.draw do
  devise_for :users
 # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"z
  root to: 'houses#index'

  resources :houses
  resources :payments
  match "*path", to: "errors#not_found", via: :all
end
