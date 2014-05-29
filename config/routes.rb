require 'api_constraints'

Rails.application.routes.draw do
  # root 'welcome#index'

  namespace :api, defaults: { format: 'json' } do

    get :ping, controller: 'application'

    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :thumbnails, only: :new
    end

  end
end
