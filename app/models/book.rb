class Book < ApplicationRecord

  validates_presence_of :title, :page_num, :year_published
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :reviews

  def self.top_rated_books
    select('books.*, AVG(rating) AS avg_rating')
    .joins(:reviews)
    .group(:id)
    .order('avg_rating DESC')
    .limit(3)
  end

  def self.low_rated_books
    select('books.*, AVG(rating) AS avg_rating')
    .joins(:reviews)
    .group(:id)
    .order('avg_rating ASC')
    .limit(3)
  end

  def self.sort_books(params)
    if params[:sort] == 'page_num'
      order(page_num: params[:order])
    elsif params[:sort] == 'avg_rating'
      select('books.*, AVG(rating) AS avg_rating')
      .joins(:reviews)
      .group(:id)
      .order("avg_rating #{params[:order]}")
    elsif params[:sort] == 'review_count'
      select('books.*, COUNT(rating) AS review_count')
      .joins(:reviews)
      .group(:id)
      .order("review_count #{params[:order]}")
    else
      all
    end
  end

end
