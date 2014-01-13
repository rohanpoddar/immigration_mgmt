require 'spec_helper'

describe Visa do
  describe "visa factory" do
    it "should create visa"do
      visa = FactoryGirl.create(:visa)
      visa.should_not be_nil
    end

    it "should not create visa for non existing passport" do
      expect{FactoryGirl.create(visa, passport_id:564434)}.to raise_error
    end


    it "should not create visa for non existing visa type" do
      expect{FactoryGirl.create(visa, visa_type_id:56443434)}.to raise_error
      Employee.find_by_employee_number(12222)
    end

  end
end