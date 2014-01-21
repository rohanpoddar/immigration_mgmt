class ReminderMailer < ActionMailer::Base
  default from: "noreply@gmail.com"

  def quarterly(employees)
    email_address = recipients_email_id(employees)
    mail to: email_address, subject: 'Your passport is about to expire'
  end

  private
  def recipients_email_id(employees)
    email_ids = Array.new
    employees.each do |e|
      email_ids << e['number'].to_s+'@thoughtworks.com'
    end
    return email_ids
  end
end
