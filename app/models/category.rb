class Category < ApplicationRecord
  validations :title, presence: true, uniqueness: true 
  has_many :ideas
end
