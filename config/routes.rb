Rails.application.routes.draw do
  root "home#index"

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :github_logout

  resources :dashboard, only: [:index]
  resources :repositories, only: [:index]
end
