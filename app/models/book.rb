class Book < ApplicationRecord
  has_many :reviews
  has_many :book_shelves
  has_many :shelves, through: :book_shelves
  has_many :book_genres
  has_many :genres, through: :book_genres
  belongs_to :author


end
