class Review < ApplicationRecord

  validates_presence_of :title, :rating, :review_text, :book_id, :user_id
  belongs_to :book
  belongs_to :user

end
