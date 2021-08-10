# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index', to: 'home#index'

  devise_for :users
  devise_for :expert
  devise_for :novice

  resources :novices, only: [:index, :edit, :update]
  resources :campaigns do
    resources :comments, module: :campaigns
    resources :todo_lists

    resources :discussion_topics do
      resources :comments, module: :discussion_topics
    end
  end

  root 'home#index'
end
