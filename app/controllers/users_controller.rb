class UsersController < ApplicationController

  def index

  end

  def show
    @user = User.find(params[:id])
    @user_reviews = @user.sorted_reviews(params)
  end

end
