Rails.application.routes.draw do
  root 'index#index'

  resources :books do
    resources :reviews, only: [:new, :create]
  end
  resources :authors
  resources :users do
    resources :reviews, only: [:destroy]
  end
end
