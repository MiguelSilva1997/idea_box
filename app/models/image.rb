class Image < ApplicationRecord
  validate :title, presence: true, uniqueness: true
  has_many :image_ideas
  has_many :ideas, through: :image_ideas
end
