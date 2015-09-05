Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }

  resources :users, only: [:show] do
    member do
      resource :profile, except: [:destroy]
      get :send_request
      get :pending_requests
      get :accept_request
      get :decline_request
      get :unfriend
    end
  end

  root 'home#index'
end
