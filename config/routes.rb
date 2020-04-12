# frozen_string_literal: true

Rails.application.routes.draw do
  root 'lists#index'
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  resources  :lists do
    resources :items, only: %i[create update destroy] do
      patch :completed, on: :member
    end
  end
end
