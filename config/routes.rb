Rails.application.routes.draw do
  # root 'index#index'
  get '/', to: 'books#index'

  # resources :books, only:[:index,:show,:new,:create,:destroy] do
  #   resources :reviews, only: [:new, :create, :destroy]
  # end
  get '/books', to: 'books#index', as: 'books'
  get 'books/new', to: 'books#new', as: 'new_book'
  get '/books/:id', to: 'books#show', as: 'book'
  post '/books', to: 'books#create'
  delete '/books/:id', to: 'books#destroy'

  get '/books/:book_id/reviews/new', to: 'reviews#new', as: 'new_book_review'
  post '/books/:book_id/reviews', to: 'reviews#create', as: 'book_reviews'
  delete '/books/:book_id/reviews/:id', to: 'reviews#destroy', as: 'book_review'

  # resources :authors, only: [:new,:create,:show,:destroy]
  # resources :users, only: [:new,:create,:show] do
  #   resources :reviews, only: [:destroy]
  # end
  get '/authors/new', to: 'authors#new', as: 'new_author'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show', as: 'author'
  delete '/authors/:id', to: 'authors#destroy'

  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  delete '/users/:user_id/reviews/:id', to: 'reviews#destroy', as: 'user_review'
end
