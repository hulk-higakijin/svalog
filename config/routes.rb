Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :companies, only: %i[show new create edit update]

  resource :profile, only: %i[show edit update]
  resolve('Profile') { [:profile] }
end
