class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
    @author_books = @author.author_books
  end
end
