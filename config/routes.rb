Rails.application.routes.draw do
  root "subs#index"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :subs, except: [:destroy]
  resources :posts, except: [:index] do
    member do
      post 'upvote', 'downvote'
    end
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create, :show] do
    member do
      post 'upvote', 'downvote'
    end
  end
end
