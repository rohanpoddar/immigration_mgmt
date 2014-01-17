class ReminderMailer < ActionMailer::Base
  default from: "noreply@gmail.com"

  def quaterly(email_address)
    mail to: email_address, subject: 'Your passport is about to expire'
  end
end
