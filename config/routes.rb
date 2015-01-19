Rails.application.routes.draw do

  resources :status, only: :index
  resources :thumbnails, only: :new
end
