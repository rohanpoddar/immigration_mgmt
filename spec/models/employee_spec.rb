require 'spec_helper'

describe Employee do

  describe 'Factory' do
    it 'should create an instance of employee' do
      FactoryGirl.create(:employee).should_not be_nil
    end
  end

  describe 'Validations: Model' do
    it "should validate presence of" do
      should validate_presence_of :name
      should validate_presence_of :number
      should validate_presence_of :joining_date
    end

    it 'should raise error for invalid joining date' do
      employee = FactoryGirl.create(:employee)
      employee.joining_date=50.years.ago
      expect { employee.save! }.to raise_error
    end

    it 'should raise error for exit date coming before joining date' do
      employee = FactoryGirl.create(:employee)
      employee.joining_date=10.years.ago
      employee.exit_date = 15.year.ago
      expect { employee.save! }.to raise_error
    end
  end

  describe 'Validations: Active Record' do
    it "employee number should be unique" do
      #Test for validates_uniqueness_of
      expect { FactoryGirl.create(:employee, number: "123") }.to_not raise_error
      expect { FactoryGirl.create(:employee, number: "123") }.to raise_error
    end

    it "employee number cannot be blank or nil" do
      expect { FactoryGirl.create(:employee, number: "") }.to raise_error
      expect { FactoryGirl.create(:employee, number: nil) }.to raise_error
    end

  end

  describe 'Associations: Model' do
    it 'Should have one passport' do
      should have_one(:passport).class_name(Passport.name)
    end
    it 'should have many visas' do
      should have_many(:visas).through(:passport)
    end
  end

  describe 'Associations: Active Record' do
    #NOTHING HERE
  end

  describe 'Methods: Active Record' do
    it 'passports_about_to_expire should return employees having passport expiry date less than a year' do
      current_date=Date.today
      FactoryGirl.create(:passport, expiry_date: current_date + 1.month)
      employee = FactoryGirl.create(:employee, number: "1212")
      FactoryGirl.create(:passport, number: 'p1234', employee: employee, expiry_date: current_date + 13.month)
      passports_about_to_expire = Employee.passports_about_to_expire(1)
      passports_about_to_expire.size.should == 1
    end
    describe '#search' do

      it 'should search the employees on the basis of params' do
        b2_visa_type = FactoryGirl.create(:visa_type, name: 'b2')
        b2_visa = FactoryGirl.create(:visa, visa_type: b2_visa_type, issue_date: 1.years.ago, expiry_date: Date.today)
        employee_two = FactoryGirl.create(:employee, number: "12321", location: "bangalore", exit_date: nil)
        passport_for_v1_visa = FactoryGirl.create(:passport, number: 'ps2312', employee: employee_two)
        FactoryGirl.create(:visa, visa_type: b2_visa_type, issue_date: "Jan 1, 2011", expiry_date: "Jan 1, 2013", passport: employee_two.passport)

        emp = Employee.search({:visa_type => "b2",
                               :location => "bangalore",
                               :min_expiry_date => "Jan 1, 2012",
                               :max_expiry_date => "Jan 25, 2013",
                               :employee => "current-employee",
                               :commit => "Search",
                               :action => "index",
                               :controller => "search"}, 10)
        emp.size.should == 1
      end

      it 'should return all employees if no search criteria is given' do
        b2_visa_type = FactoryGirl.create(:visa_type, name: 'b2')
        b2_visa = FactoryGirl.create(:visa, visa_type: b2_visa_type, issue_date: 1.years.ago, expiry_date: Date.today)
        employee_two = FactoryGirl.create(:employee, number: "12321", location: "bangalore")
        passport_for_v1_visa = FactoryGirl.create(:passport, number: 'ps2312', employee: employee_two)
        FactoryGirl.create(:visa, visa_type: b2_visa_type, issue_date: "Jan 1, 2011", expiry_date: "Jan 1, 2013", passport: employee_two.passport)

        emp = Employee.search({:action => "index",
                               :controller => "search"}, 10)
        emp.size.should == 2
      end
    end
  end

  describe 'Methods: Model' do
    it 'delete! over employee should change isDeleted to 1' do
      employee=FactoryGirl.create(:employee)
      employee.isDeleted?.should be_false
      employee.delete!
      employee.isDeleted?.should be_true
    end
  end


end
