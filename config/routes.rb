Rails.application.routes.draw do

  devise_for :users

  resources :contacts, only: [:index]
  namespace :contacts do
    resources :companies, except: [:index]
    resources :people, except: [:index]
  end

  root 'contacts#index'
end
