Rails.application.routes.draw do

  devise_for :users

  namespace :contacts do
    resources :companies
    resources :people
  end
  resources :contacts

  root 'contacts#index'
end
