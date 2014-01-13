require 'spec_helper'

describe Passport do
  describe "passport factory" do
    it "should create passport"do
      @emp = FactoryGirl.build(:employee)
      @emp.id = 23
      @emp.employee_number = "3434534"
      passport = FactoryGirl.create(:passport, employee: @emp)
      passport.should_not be_nil
    end

    it "should not create passport for non exixting employee" do
      expect{FactoryGirl.create(:passport, employee_id:564)}.to raise_error

    end

  end
end