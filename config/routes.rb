Rails.application.routes.draw do
  # get 'drawings/index'
  # get 'drawings/create'
  # get 'drawings/show'
  # get 'subcontractors/index'
  # get 'subcontractors/create'
  # get 'subcontractors/show'
  # get 'notes/index'
  # get 'notes/create'
  # get 'notes/show'
  # get 'meetings/index'
  # get 'meetings/create'
  # get 'meetings/show'
  # get 'projects/index'
  # get 'projects/create'
  # get 'projects/show'
  # get 'users/create'
root 'users#sign_in'
resources :users, only: [:create]
  post "/sign-in", to: "users#sign_in"
  get "/validate", to: "users#validate"

resources :projects, only: [:index, :create, :show]
resources :meetings, only: [:index, :create, :show]
resources :notes, only: [:index, :create, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
