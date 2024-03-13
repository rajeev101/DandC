class Course < ApplicationRecord
	has_one_attached :image
	has_many :syllabuses
end
