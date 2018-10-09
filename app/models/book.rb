class Book < ApplicationRecord

  validates_presence_of :title, :page_num, :date_published, :author_id
  has_many :authors

end
