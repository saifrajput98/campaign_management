# frozen_string_literal: true

Rails.application.routes.draw do
  resources :campaigns do
    resources :discussion_topics
  end

  root 'campaigns#index'
end
