Rails.application.routes.draw do
  # For user authentication
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :voting_events, only: [:index, :show, :create, :update, :destroy]
  resources :user_votes, only: [:index, :show, :create, :update, :destroy]
  resources :candidates, only: [:index, :show, :create, :update, :destroy]
  resources :feedbacks, only: [:index, :show, :create, :update, :destroy]


end
