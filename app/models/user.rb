class User < ActiveRecord::Base
  has_secure_password
  has_many :shelves
  has_many :reviews
end
