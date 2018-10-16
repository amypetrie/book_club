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

  def new
    @book = Book.new
  end

  def create
    author_names = book_author_params[:authors].split(", ")
    author_objects = author_names.map do |author_name|
      if Author.find_by(name: author_name) == nil
        author = Author.create(name: author_name)
      else
        author = Author.find_by(name: author_name)
      end
    end
      if Book.find_by(title: book_params[:title]) == nil
        book = author_objects.first.books.create(book_params)
        author_objects.delete_at(0)
        if author_objects.length > 0
          author_objects.each do |author|
            book.authors << author
          end
        end
        redirect_to book_path(Book.all.last)
      else
        redirect_to new_book_path
      end
  end

  private
    def book_params
      params.require(:book).permit(:title, :page_num, :year_published)
    end

    def book_author_params
      params.require(:book).permit(:authors)
    end
end
