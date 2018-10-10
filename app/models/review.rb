class Review < ApplicationRecord

  validates_presence_of :review_title, :rating, :review_text, :book_id, :user_name
  belongs_to :book

end
