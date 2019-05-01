# frozen_string_literal: true

Rails.application.routes.draw do

  get ':page', to: 'pages#show'

  root to: 'pages#frontpage'
end
