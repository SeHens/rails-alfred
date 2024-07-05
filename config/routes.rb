# routes.rb
Rails.application.routes.draw do
  devise_for :users

  scope '/alfred' do
    resources :startups do
      member do
        patch 'favorite'
        patch 'unfavorite'
      end
    end

    get 'favorites', to: 'startups#favorites', as: 'favorites'

    root to: "startups#index", as: 'alfred_root'
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'home#index'
end
