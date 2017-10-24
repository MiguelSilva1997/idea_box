class Idea < ApplicationRecord
  validates :title, presence: true
  has_many :image_ideas
  has_many :images, through: :image_ideas
  belongs_to :category
  belongs_to :user
end
