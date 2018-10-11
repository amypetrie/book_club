class BooksController < ApplicationController
  def index
    @books = Book.all
    @top_books = Book.top_books
    @low_books = Book.low_books
    @high_activity_users = User.high_activity_users
  end

  def show
    @book = Book.find(params[:id])
    @top_reviews = @book.reviews.top_reviews
    @low_reviews = @book.reviews.low_reviews
  end

end
