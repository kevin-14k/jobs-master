# frozen_string_literal: true

Rails.application.routes.draw do
  resources :heroes
  post 'heroes/battle', to: 'heroes#battle', as: 'battle_heroes'

  root 'pages#index'
end
