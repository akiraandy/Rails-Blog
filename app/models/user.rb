class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post

  has_secure_password
  validates_presence_of :email, :username, :password_digest
  validates :auth_token, uniqueness: true
end
