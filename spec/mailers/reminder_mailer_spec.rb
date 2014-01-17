require "spec_helper"

describe ReminderMailer do
  let(:email_address) { 'foo@test.com' }
  let(:mail) { ReminderMailer.quaterly(email_address) }

  it 'renders the subject ' do
    mail.subject.should == 'Your passport is about to expire'
  end

  it 'renders the receiver email ' do
    mail.to.should == ['foo@test.com']
  end

  it 'renders the sender email ' do
    mail.from.should == ['noreply@gmail.com']
  end
end
