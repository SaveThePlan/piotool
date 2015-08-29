Rails.application.routes.draw do

  namespace :contacts do
    resources :people
  end
  resources :contacts

  root 'contacts#index'
end
