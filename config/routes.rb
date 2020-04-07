# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, except: [:new, :show] do
    patch :completed, on: :member
  end
end
