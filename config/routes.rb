Rails.application.routes.draw do
  root 'index#index'

  resources :books, only:[:index,:show,:new,:create,:destroy] do
    resources :reviews, only: [:new, :create]
  end
  resources :authors, only: [:new,:create,:show,:destroy]
  resources :users, only: [:new,:create,:show] do
    resources :reviews, only: [:destroy]
  end
end
