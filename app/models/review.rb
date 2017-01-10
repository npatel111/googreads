class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :rating, numericality: { only_integer: true }
  validates :rating, :inclusion => {:in => (1..5)}
  validates :rating, presence: true
  validates :content, presence: true
end
