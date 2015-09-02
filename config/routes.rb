Rails.application.routes.draw do

  devise_for :users

  resources :contacts, only: [:index]
  namespace :contacts do
    resources :companies, except: [:index]
    resources :people, except: [:index]
  end

  get 'notes/new/:contact_id', to: 'notes#new_for_contact', as: 'new_note_for_contact'
  resources :notes

  resources :users, only: [:index] do
    post 'act_as', on: :member
    delete 'myself_again', on: :collection
  end

  root 'contacts#index'
end
