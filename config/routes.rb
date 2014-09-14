Rails.application.routes.draw do

  # resources for json only
  resources :tasks, except: [:new, :edit]

  # all other paths route to books#index for single page
  match "*path", to: "tasks#index", via: "get"

  root 'sites#index'

end
