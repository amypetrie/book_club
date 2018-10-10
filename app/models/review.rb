class Review < ApplicationRecord

  validates_presence_of :review_title, :rating, :review_text, :book_id, :user_id
  belongs_to :book
  belongs_to :user

  def self.avg_rating
    average(:rating).round(1)
  end

end
