class User < ActiveRecord::Base
  has_secure_password
  has_many :shelves
  has_many :reviews
  validates :name, presence: true
  validates :password, presence: true
  validates :name, uniqueness: true
end
