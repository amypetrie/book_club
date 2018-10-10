class Book < ApplicationRecord

  validates_presence_of :title, :page_num, :year_published
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :reviews

  def self.top_books
    select('books.*, AVG(rating) AS avg_rating').joins(:reviews).group(:id).order('avg_rating DESC').limit(3)
  end

  def self.low_books
    select('books.*, AVG(rating) AS avg_rating').joins(:reviews).group(:id).order('avg_rating ASC').limit(3)
  end

end
