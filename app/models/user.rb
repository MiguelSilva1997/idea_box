class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
  has_many :ideas

  enum role: [:default, :admin]
end
