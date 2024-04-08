class Registration < ApplicationRecord
  validates :your_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
