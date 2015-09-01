Rails.application.routes.draw do

  devise_for :users

  resources :contacts, only: [:index]
  namespace :contacts do
    resources :companies, except: [:index]
    resources :people, except: [:index]
  end

  namespace :notes do
    resources :desires
    resources :offers
  end

  resources :users, only: [:index] do
    post 'act_as', on: :member
    delete 'myself_again', on: :collection
  end

  root 'contacts#index'
end
