Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :coaching_offers, only: [:show, :new, :create] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:show]
end
