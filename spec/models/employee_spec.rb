require 'spec_helper'

describe Employee do
  describe 'factory'do
    it 'should create an instance of employee'do
      FactoryGirl.create(:employee).should_not be_nil
    end
  end
end
