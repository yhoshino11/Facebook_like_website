Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    member do
      resource :profile, except: [:destroy]
      get :send_request
      get :pending_requests
      get :accept_request
    end
  end

  root 'home#index'
end
