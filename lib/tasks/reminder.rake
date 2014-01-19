namespace 'reminder' do
  desc "This is to send an email to employees"
  task(:reminder_mailer => :environment) do
    employees = Employee.passport_about_to_expire(1)
    ReminderMailer.quaterly(employees).deliver!
  end
end