Rails.application.routes.draw do

# root 'users#sign_in'

resources :users, only: [:create]
  post "/sign-in", to: "users#sign_in"
  get "/validate", to: "users#validate"
  get "/home", to: "users#home"


resources :projects, only: [:index, :create, :show]
resources :meetings, only: [:index, :create, :show]
resources :notes, only: [:index, :create, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
