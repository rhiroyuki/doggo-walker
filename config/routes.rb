# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :dog_walkings, only: [:index, :show, :create] do
        member do
          put :start_walk
          put :finish_walk
        end
      end
    end
  end
end
