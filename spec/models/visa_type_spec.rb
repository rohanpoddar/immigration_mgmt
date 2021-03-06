require 'spec_helper'

describe VisaType do

  describe "Factory" do
    it "should create visa type" do
      visa_type = FactoryGirl.create(:visa_type)
      visa_type.should_not be_nil
    end
  end

  describe 'Validations: Model' do
    it 'should validate presence of name' do
      should validate_presence_of :name
    end
  end

  describe 'Validations: ActiveRecord ' do
    it "should not create Visa Type with null value of visa_type" do
      expect { FactoryGirl.create(:visa_type, name: nil) }.to raise_error
    end

    it "should not allow creation of duplicate Visa types" do
      expect { FactoryGirl.create(:visa_type) }.to_not raise_error
      expect { FactoryGirl.create(:visa_type).should }.to raise_error
    end
  end

  describe 'Associations: Model' do
    it 'should have many visas' do
      should have_many :visas
    end
  end

  describe 'Associations: ActiveRecord' do
    #NOTHING HERE
  end

  describe 'Methods: Model' do
    it 'delete! over visa type should change isDeleted to 1' do
      visa_type=FactoryGirl.create(:visa_type)
      visa_type.isDeleted?.should be_false
      visa_type.delete!
      visa_type.isDeleted?.should be_true
    end
  end

end