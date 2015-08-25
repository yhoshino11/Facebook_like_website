Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    member do
      resource :profile, except: [:destroy]
    end
  end

  root 'home#index'
end
