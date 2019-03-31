# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'comments/create'
  get 'comments/update'
  get 'comments/destroy'
  namespace :api do
    namespace :v1 do
      get "check_token", to: "base#check_token", defaults: { format: :json }
      resources :user
      resources :accounts, only: [:show, :create, :update, :destroy]
      resources :boards do
        resources :cards, only: [:index, :create]
      end
      resources :cards, only: [:show, :update, :destroy]
    end
  end

  post '/login', to: 'sessions#create'
end
