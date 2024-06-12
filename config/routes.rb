# routes.rb
Rails.application.routes.draw do
  resources :startups do
    member do
      patch 'favorite'
      patch 'unfavorite'
    end
  end

  devise_for :users
  root to: "startups#index"

  get 'favorites', to: 'startups#favorites'

  get "up" => "rails/health#show", as: :rails_health_check
end
