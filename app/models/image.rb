class Image < ApplicationRecord
  validates_presence_of :name, :image
  has_many :image_ideas
  has_many :ideas, through: :image_ideas
end
