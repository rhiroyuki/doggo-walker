# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dog_walking, only: [:index]
end
