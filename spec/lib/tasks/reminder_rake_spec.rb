require 'spec_helper'
require 'rake'

describe 'reminder namespace rake task ' do
  before :all do
    Rake.application.rake_require 'tasks/reminder'
    Rake::Task.define_task(:environment)
  end
  describe 'reminder:reminder_mailer' do
    it "should call employees method for fetching employees whose passport is about to expire" do
      employees = []
      mail = double("mailer")
      employees << Employee.new
      Employee.should_receive(:passport_about_to_expire).and_return(employees)
      ReminderMailer.should_receive(:quaterly).with(employees).and_return(mail)
      mail.should_receive(:deliver!)

      Rake::Task['reminder:reminder_mailer'].invoke
    end
  end
end