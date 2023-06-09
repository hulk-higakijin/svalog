Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :companies, only: %i[show new create edit update]
  resource :shifts, only: %i[show edit update]

  namespace :members do
    resource :shifts, only: %i[show]
  end
end
