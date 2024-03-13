class Syllabus < ApplicationRecord
  belongs_to :course
  # scope :by_course, ->(course_id) { where(course_id: course_id) }
end
