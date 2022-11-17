Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :coaching_offers, only: [:index, :show, :new, :create] do
    resources :bookings
  end
end
