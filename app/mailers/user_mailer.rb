class UserMailer < ApplicationMailer
  def password_reset_instructions(account)
    @account = account
    host = Rails.application.config.action_mailer.default_url_options.try(:[], :host) || 'localhost:3000'
    @reset_url = edit_password_reset_url(token: @account.password_reset_token, host: host)
    mail(to: @account.email, subject: 'Reset Your Password')
  end


  def password_reset_confirmation(account)
    @account = account
    mail(to: @account.email, subject: 'Your Password Has Been Reset')
  end
end
