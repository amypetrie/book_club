class Review < ApplicationRecord

  validates_presence_of :review_title, :rating, :review_text, :book_id, :user_id
  belongs_to :book
  belongs_to :user

  def self.avg_rating
    average(:rating)
  end

  def self.top_reviews
    order(rating: :DESC).limit(3)
  end

  def self.low_reviews
    order(rating: :ASC).limit(3)
  end

end
