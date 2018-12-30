# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user
      resources :accounts, only: [:show, :create, :update, :destroy]
      resources :boards
    end
  end
end
