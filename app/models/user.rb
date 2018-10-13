class User < ApplicationRecord

  validates_presence_of :user_name
  has_many :reviews

  def self.high_activity_users
    select('users.*, COUNT(reviews) AS review_count')
    .joins(:reviews)
    .group(:id)
    .order('review_count DESC')
    .limit(3)
  end

  def sorted_reviews(params)

    if params[:sort] == 'newest'
      reviews.order(created_at: :desc)
    elsif params[:sort] == 'oldest'
      reviews.order(created_at: :asc)
    else
      reviews
    end

  end

end
