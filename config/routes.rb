Rails.application.routes.draw do

  # resources :users, only: [:create, :show] do
  #   resources :recipes, only: [:show]

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get '/recipes', to: 'recipes#index'
  post '/recipes', to: 'recipes#create'

  get "/me", to: "users#show"
  post '/signup', to: "users#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
