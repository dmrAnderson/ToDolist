# frozen_string_literal: true

Rails.application.routes.draw do
  root 'lists#index'
  devise_for :users
  resources  :lists do
    resources  :items, only: [:create, :update, :destroy] do
      patch :completed, on: :member
    end
  end
end
