# routes.rb
Rails.application.routes.draw do
  scope '/alfred' do
    resources :startups do
      member do
        patch 'favorite'
        patch 'unfavorite'
      end
    end

    get 'favorites', to: 'startups#favorites', as: 'favorites'

    # Set the root to startups#index within the /alfred scope
    root to: "startups#index", as: 'alfred_root'
  end

  devise_for :users

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route for home page
  root to: 'home#index'
end
