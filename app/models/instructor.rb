class Instructor < ApplicationRecord
	has_one_attached :image
	# belongs_to :learning
end
