# frozen_string_literal: true

Rails.application.routes.draw do
  resources :battle_histories, only: [:index]

  resources :heroes do
    member do
      post 'add_weapon'
      delete 'remove_weapon/:weapon_id', to: 'heroes#remove_weapon', as: 'remove_weapon'
    end
  end

  post 'heroes/battle', to: 'heroes#battle', as: 'battle_heroes'

  root 'pages#index'
end
