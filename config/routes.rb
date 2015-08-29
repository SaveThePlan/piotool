Rails.application.routes.draw do

  devise_for :users

  namespace :contacts do
    resources :people
  end
  resources :contacts

  root 'contacts#index'
end
