class Book < ApplicationRecord

  validates_presence_of :title, :page_num, :year_published
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :reviews

end
