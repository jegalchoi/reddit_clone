Rails.application.routes.draw do
  root "users#placeholder"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :subs, except: [:destroy]
  resources :posts, except: [:index]
end
