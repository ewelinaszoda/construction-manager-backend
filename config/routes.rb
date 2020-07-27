Rails.application.routes.draw do

# root 'users#sign_in'

resources :users, only: [:index, :create, :update, :destroy]
  post "/sign-in", to: "users#sign_in"
  get "/validate", to: "users#validate"
  get "/home", to: "users#home"

resources :projects, only: [:index, :create, :show, :destroy] 
resources :meetings, only: [:index, :create, :show ] 
resources :notes, only: [:index, :create, :show, :edit ]

get "/my-projects", to: "projects#my_projects"
get "/my-meetings", to: "meetings#my_meetings"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
