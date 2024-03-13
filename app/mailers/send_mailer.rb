class SendMailer < ApplicationMailer
  def send_email(to_email, registration)

    # byebug
    @registration = registration


    mail(to: to_email, subject: "registration list", body: "@registration") do |format|
      # format.text { render plain: message }
      format.html { render 'send_mailer/send_email'}
      # format.html { render 'send_mailer/send_page'}
    end
  end
end
