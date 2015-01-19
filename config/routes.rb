Rails.application.routes.draw do

  resources :status, only: :index
  resources :thumbnails, only: :new

  get '*a', controller: 'application', action: 'not_found'
end
