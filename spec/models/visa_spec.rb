require 'spec_helper'

describe Visa do

  describe "Factory" do
    it "should create Visa" do
      visa = FactoryGirl.create(:visa)
      visa.should be_valid
    end
  end

  describe 'Validations : Active Record ' do
    it "should not create visa for nil passport id" do
      expect{FactoryGirl.create(:visa, passport_number: "")}.to raise_error
      expect{FactoryGirl.create(:visa, passport_number: nil)}.to raise_error
    end

    it "should not create visa for nil visa type" do
      expect{FactoryGirl.create(:visa, visa_type_name: "")}.to raise_error
      expect{FactoryGirl.create(:visa, visa_type_name: nil)}.to raise_error
    end

    it "should not create a visa without a valid status" do
      expect{FactoryGirl.create(:visa, status: nil)}.to raise_error
    end
  end

  describe 'Associations : Model ' do
    it "should belong to a particular Visa Type" do
      visa = FactoryGirl.create(:visa)
      visa.should belong_to :visa_type
    end

    it "should belong to a valid Passport" do
      visa = FactoryGirl.create(:visa)
      visa.should belong_to :passport
    end
  end

  describe 'Associations : Active Record'  do
    it "should not create visa for non existing passport" do
      visa =FactoryGirl.create(:visa)
      puts visa.passport.number
      visa.passport_number="11qnjdjasads"
      puts visa.passport_number
      expect{visa.save!}.to raise_error
    end

    it "should not create visa for non existing visa type" do
      visa=FactoryGirl.create(:visa)
      visa.visa_type_name="kuch bhi"
      puts visa.visa_type_name
      expect{visa.save!}.to raise_error
    end
  end
end
