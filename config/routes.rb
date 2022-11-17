Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  get 'dashboard', to: 'dashboards#dashboard', as: 'dashboard'

  resources :coaching_offers, only: [:index, :show, :new, :create] do
    resources :bookings, except: :show
  end
  resources :bookings, only: [:show] do
    resources :reviews, only: [:new, :create]
  end
end
