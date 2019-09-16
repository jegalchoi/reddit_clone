Rails.application.routes.draw do
  root "users#placeholder"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end
