class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
    @author_books = @author.author_books
  end

  def destroy
    author = Author.find(params[:id])
    author.books.each do |b|
      if b.authors.length < 2
        b.destroy
      else
      end
    end
    author.destroy
    redirect_to books_path
  end

end
