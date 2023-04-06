Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  root 'home#index'
  devise_for :users

  resource :profile, only: %i[show edit update]
  resolve('Profile') { [:profile] }
end
