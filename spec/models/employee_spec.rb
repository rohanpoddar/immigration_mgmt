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
      expect { FactoryGirl.create(:employee, number: 123) }.to_not raise_error
      expect { FactoryGirl.create(:employee, number: 123) }.to raise_error
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

  describe 'passport about to expire' do
    it 'it should return employees  having passport expiry date less than a year' do
      current_date=Date.today
      FactoryGirl.create(:passport, expiry_date: current_date - 1.month)
      employee = FactoryGirl.create(:employee, number: 1212)
      FactoryGirl.create(:passport, number: 'p1234', employee: employee, expiry_date: current_date - 13.month)
      passports_about_to_expire = Employee.passport_about_to_expire(1)
      passports_about_to_expire.size.should == 1
    end
  end

end
