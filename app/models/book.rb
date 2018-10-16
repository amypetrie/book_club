class Book < ApplicationRecord

  validates_presence_of :title, :page_num, :year_published
  has_many :author_books
  has_many :authors, through: :author_books, dependent: :destroy
  has_many :reviews, dependent: :destroy

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

  # def self.no_ratings
  #   where(rating: nil)
  # end

  def self.sort_books(params)
    order = params[:order]
    if order == "DESC"
      null_order = "NULLS LAST"
    else
      null_order = "NULLS FIRST"
    end
    if params[:sort] == 'page_num'
      order(page_num: params[:order])
    elsif params[:sort] == 'avg_rating'
      x = select('books.*, AVG(rating) AS avg_rating')
      .left_outer_joins(:reviews)
      .group(:id)
      .order("avg_rating #{params[:order]} #{null_order}")
    elsif params[:sort] == 'review_count'
      select('books.*, COUNT(rating) AS review_count')
      .left_outer_joins(:reviews)
      .group(:id)
      .order("review_count #{params[:order]} NULLS FIRST")
    else
      all.order(title: :asc)
    end
  end

  def top_review
    reviews.order(rating: :DESC).first
  end

end
