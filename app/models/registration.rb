class Registration < ApplicationRecord
  self.table_name = :registrations
  validates :your_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :course_of_interest, presence: true
  validates :message, presence: true

end
