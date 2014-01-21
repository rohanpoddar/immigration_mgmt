require "spec_helper"

describe ReminderMailer do
  let(:emp_1) { createEmployee(13959, 'emp_one') }
  let(:emp_2) { createEmployee(1234, 'emp_two') }
  let(:emp_3) { createEmployee(12344, 'emp_three') }
  let(:employees) { [emp_1, emp_2, emp_3] }
  let(:mail) { ReminderMailer.quarterly(employees) }

  it 'renders the subject ' do
    mail.subject.should == 'Your passport is about to expire'
  end

  it 'renders the sender email ' do
    mail.from.should == ['noreply@gmail.com']
  end

  describe 'recipients email id ' do
    it 'should return all the employees email id' do
      mail.to.should == ['13959@thoughtworks.com', '1234@thoughtworks.com', '12344@thoughtworks.com']
    end
  end

  def createEmployee(number, name)
    emp = Employee.new
    emp.number = number
    emp.name = name
    return emp
  end
end
