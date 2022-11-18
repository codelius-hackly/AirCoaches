Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  get 'dashboard', to: 'dashboards#dashboard', as: 'dashboard'

  patch 'status/:id', to: 'bookings#status', as: 'status'

  resources :coaching_offers, only: [:index, :show, :new, :create] do
    resources :bookings, except: :show
  end

  resources :bookings, only: [:show, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  # resources :dashboard, only: [:show] do
  #   resources :bookings, only: [:edit, :update, :destroy]
  # end

end
