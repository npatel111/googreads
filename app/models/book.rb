class Book < ApplicationRecord
  has_many :reviews
  has_many :book_shelves
  has_many :shelves, through: :book_shelves
  belongs_to :author
  belongs_to :genre

end
