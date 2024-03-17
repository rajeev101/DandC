class Account < ApplicationRecord
  has_secure_password

	attr_accessor :password_reset_token, :password_reset_sent_at

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

	def generate_password_reset_token
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_sent_at = Time.zone.now
    save!
  end

	def password_reset_token_expired?
    password_reset_sent_at < 1.hours.ago
  end

end
