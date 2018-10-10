class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @top_reviews = @book.reviews.top_reviews
    @low_reviews = @book.reviews.low_reviews
  end

end
