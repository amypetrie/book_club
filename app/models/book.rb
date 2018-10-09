class Book < ApplicationRecord

  validates_presence_of :title, :page_num, :date_published, :author_id
  has_many :author_books
  has_many :authors, through: :author_books

end
