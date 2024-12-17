# frozen_string_literal: true

Rails.application.routes.draw do
  resources :heroes

  root 'pages#index'
end
