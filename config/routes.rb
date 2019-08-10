# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders, only: %i[new create]

  get ':page', to: 'pages#show'

  root to: 'pages#frontpage'
end
