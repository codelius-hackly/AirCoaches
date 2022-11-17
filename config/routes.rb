Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  get 'dashboard', to: 'dashboards#dashboard', as: 'dashboard'

  resources :coaching_offers, only: [:show, :new, :create] do
    resources :bookings
  end
end
