require 'spec_helper'

describe VisaType do
  describe "visa_type factory" do
    it "should create visa type"do
      visa_type = FactoryGirl.create(:visa_type)
      visa_type.should_not be_nil
    end

    it "should not create visa type with nill visa type value" do
      expect{FactoryGirl.create(:visa_type, visa_type:nil)}.to raise_error
    end

  end
end