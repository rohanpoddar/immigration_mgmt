require 'spec_helper'

describe VisaType do

  describe "Factory" do
    it "should create visa type"do
      visa_type = FactoryGirl.create(:visa_type)
      visa_type.should_not be_nil
    end
  end

  describe 'Validations : ActiveRecord ' do
    it "should not create Visa Type with null value of visa_type" do
      expect{FactoryGirl.create(:visa_type, name: nil)}.to raise_error
    end

    it "should not allow creation of duplicate Visa types" do
      expect{FactoryGirl.create(:visa_type)}.to_not raise_error
      expect{FactoryGirl.create(:visa_type).should}.to raise_error
    end
  end

end