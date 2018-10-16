class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @user = User.new
    @review = Review.new
  end

  def create
    reviewed_book = Book.find(params[:book_id])
    user_name = review_user_params[:user]
    if User.find_by(user_name: user_name) == nil
      user = User.create(user_name: user_name)
    else
      user = User.find_by(user_name: user_name)
    end

    review = reviewed_book.reviews.create(rating: review_params[:rating], review_text: review_params[:review_text], review_title: review_params[:review_title], user_id: user.id)
    redirect_to book_url(reviewed_book)
  end

  def destroy
    user = User.find(params[:user_id])
    review = Review.find(params[:id])
    review.destroy
    redirect_to user_path(user)
  end

  private
    def review_params
      params.require(:review).permit(:rating, :review_text, :review_title)
    end

    def review_user_params
      params.require(:review).permit(:user)
    end
end
