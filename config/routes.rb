Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  root 'home#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get 'home/about'
  resources :users, only: %i(index show edit update)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
