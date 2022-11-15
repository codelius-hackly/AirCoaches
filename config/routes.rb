Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :coaching_offers, only: [:show, :new, :create]
end
