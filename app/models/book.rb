class Book < ApplicationRecord
  has_many :reviews
  has_many :book_shelves
  has_many :shelves, through: :book_shelves
  has_many :book_genres
  has_many :genres, through: :book_genres
  belongs_to :author
  validates :title, presence: true

  def list_genres(book)
    book.genres.map do |genre|
      genre.name
    end.join(", ")
  end

  def list_reviews(book)
    # byebug
    book.reviews.map do |review|
      "Rating: #{review.rating}
      Content: #{review.content}\r"
    end.join(",  ")
    #WHY WON"T IT DO A LINE BREAK -_-
  end



end
