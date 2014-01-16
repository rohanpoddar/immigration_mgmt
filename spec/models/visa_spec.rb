require 'spec_helper'

describe Visa do

  describe "Factory" do
    it "should create Visa" do
      visa = FactoryGirl.create(:visa)
      visa.should be_valid
    end
  end

  describe 'Validations: Model' do
    it 'should validate presence of status' do
      should validate_presence_of :status
    end

    it 'should validate if expiry date is before issue date' do
      visa= FactoryGirl.create(:visa)
      visa.issue_date=1.years.ago
      visa.expiry_date=2.years.ago
      expect{visa.save!}.to raise_error
    end
  end

  describe 'Validations: Active Record' do
    it "should not create visa for nil passport id" do
      expect { FactoryGirl.create(:visa, passport_number: "") }.to raise_error
      expect { FactoryGirl.create(:visa, passport_number: nil) }.to raise_error
    end

    it "should not create visa for nil visa type" do
      expect { FactoryGirl.create(:visa, visa_type_name: "") }.to raise_error
      expect { FactoryGirl.create(:visa, visa_type_name: nil) }.to raise_error
    end

    it "should not create a visa without a valid status" do
      expect { FactoryGirl.create(:visa, status: nil) }.to raise_error
    end
  end

  describe 'Associations: Model' do
    it 'should belong to Passport' do
      should belong_to :passport
    end

    it 'should belong to Visa Type' do
      should belong_to :visa_type
    end

    it 'should have one immigration' do
      should have_one :immigration
    end
  end

  describe 'Associations: Active Record' do
    it " should belong to a valid Passport" do
      visa = FactoryGirl.create(:visa)
      visa.passport.should be_valid
    end

    it " should not create visa for non existing passport" do
      visa =FactoryGirl.create(:visa)
      visa.passport_number="Invalid Number"
      expect { visa.save! }.to raise_error
    end

    it " should belong to a particular Visa Type" do
      visa = FactoryGirl.create(:visa)
      visa.visa_type.should be_valid
    end

    it " should not create visa for non existing visa type" do
      visa=FactoryGirl.create(:visa)
      visa.visa_type_name="Non Existing Type"
      expect { visa.save! }.to raise_error
    end
  end
  
  describe 'Model: Methods' do
    it 'isExpired should return true for Expired visa' do
      visa=FactoryGirl.create(:visa)
      visa.expiry_date=1.years.ago
      assert visa.isExpired? == true
    end

    it 'isExpired should return false for Valid visa' do
      visa=FactoryGirl.create(:visa)
      visa.expiry_date=Time.now+1.year
      assert visa.isExpired? == false
    end

    it 'monthsLeft should return correct number of months left' do
      currentTime=Time.now+5.months
      visa=FactoryGirl.create(:visa)
      visa.expiry_date=currentTime
      assert visa.monthsLeftToExpire == 5
    end

    it 'monthsLeft should return 0 months left for visa expiring this month' do
      currentTime=Time.now
      visa=FactoryGirl.create(:visa)
      visa.expiry_date=currentTime
      assert visa.monthsLeftToExpire == 0
    end
  end

end
