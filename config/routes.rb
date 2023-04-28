Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :companies, only: %i[show new create edit update]
  resource :shifts, only: %i[show edit update] do
    resource :members, only: %i[show]
  end
end
