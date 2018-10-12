class BooksController < ApplicationController
  def index
    @books = Book.sort_books(params)
    @top_rated_books = Book.top_rated_books
    @low_rated_books = Book.low_rated_books
    @high_activity_users = User.high_activity_users
  end

  def show
    @book = Book.find(params[:id])
    @top_reviews = @book.reviews.top_reviews
    @low_reviews = @book.reviews.low_reviews
  end

end
