Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :coaching_offers, only: [:show, :new, :create] do
    resources :bookings, except: :show
  end
  resources :bookings, only: [:show] do
    resources :reviews, only: [:new, :create]
  end
end
