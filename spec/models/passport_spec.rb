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
      expect { FactoryGirl.create(:passport, employee_number: "198") }.to raise_error
    end
    it 'should have a valid employee' do
      passport=FactoryGirl.create(:passport)
      passport.employee.should be_valid
    end
  end

  describe 'Methods: Model' do
    it 'isExpired should return true for Expired Passport' do
      passport=FactoryGirl.create(:passport)
      passport.expiry_date=1.years.ago
      assert passport.isExpired? == true
    end

    it 'isExpired should return false for Valid Passport' do
      passport=FactoryGirl.create(:passport)
      passport.expiry_date=Time.now+1.year
      assert passport.isExpired? == false
    end

    it 'monthsLeft should return correct number of months left' do
      currentTime=Time.now+5.months
      passport=FactoryGirl.create(:passport)
      passport.expiry_date=currentTime
      assert passport.monthsLeftToExpire == 5
    end

    it 'monthsLeft should return 0 months left for passport expiring this month' do
      currentTime=Time.now
      passport=FactoryGirl.create(:passport)
      passport.expiry_date=currentTime
      assert passport.monthsLeftToExpire == 0
    end

    it 'delete! over passport should change isDeleted to 1' do
      passport=FactoryGirl.create(:passport)
      passport.isDeleted?.should be_false
      passport.delete!
      passport.isDeleted?.should be_true
    end

  end
end