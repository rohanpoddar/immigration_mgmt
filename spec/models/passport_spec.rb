require 'spec_helper'

describe Passport do
  describe "Factory" do
    it " should create passport" do
      passport = FactoryGirl.create(:passport)
      passport.should_not be_nil
    end
  end

  describe 'Validations: Model' do
    it 'should validate presence of' do
      validate_presence_of :number
    end
  end

  describe 'Validations: Active Record' do
    it "should not create passport for nil employee id" do
      expect { FactoryGirl.create(:passport, employee_number: nil) }.to raise_error
    end

    it "should not create passport for an employee who already has a passport" do
      FactoryGirl.create(:employee)
      expect { FactoryGirl.create(:passport) }.to raise_error
    end
  end

  describe 'Associations: Model' do
    it 'should belong to employee' do
      should belong_to :employee
    end

    it 'should have many visas' do
      should have_many :visas
    end
  end

  describe 'Associations: ActiveRecord' do
    it "should not create passport for non existing employee" do
      expect { FactoryGirl.create(:passport, employee_number: 198) }.to raise_error
    end
    it 'should have a valid employee' do
      passport=FactoryGirl.create(:passport)
      passport.employee.should be_valid
    end
  end
end