# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :dog_walkings, only: [:index]
    end
  end
end
