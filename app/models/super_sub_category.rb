class SuperSubCategory < ApplicationRecord
  belongs_to :subcategory
  has_many :topics
end
