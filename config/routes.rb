Rails.application.routes.draw do
  root 'index#index'

  resources :books
  resources :authors
  resources :users
end
