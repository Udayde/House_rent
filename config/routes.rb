# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  get 'users/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"z
  root to: 'houses#index'

  resources :houses
  resources :payments
  namespace :users do
    resources :users
  end
  resources :feeds, only: %i[create destroy]
end
