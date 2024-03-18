class Subcategory < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_many :super_sub_categories
end
