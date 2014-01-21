namespace 'reminder' do
  desc "This is to send an email to employees"
  task(:reminder_mailer => :environment) do
    employees = Employee.passports_about_to_expire(1)
    ReminderMailer.quarterly(employees).deliver!
  end
end