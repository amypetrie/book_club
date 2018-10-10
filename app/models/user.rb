class User < ApplicationRecord

  validates_presence_of :user_name
  has_many :reviews
end
