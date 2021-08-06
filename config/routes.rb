# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index', to: 'home#index'

  devise_for :users
  devise_for :expert
  devise_for :novice

  resources :campaigns do
    resources :discussion_topics
  end

  root 'home#index'
end
