Rails.application.routes.draw do
  resources :dog_walking, only: [:index]
end
