Rails.application.routes.draw do
  root "home#index"

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'

  resources :dashboard, only: [:index]
  resources :repositories, only: [:index]
end
