class BooksController < ApplicationController
  def index
    @books = Book.all
    @top_books = Book.top_books
    @low_books = Book.low_books
  end
end
