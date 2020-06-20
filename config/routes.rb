Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get 'home/about'
  resources :users, only: %i(index show edit update)
  resources :books, except: %i(new)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
