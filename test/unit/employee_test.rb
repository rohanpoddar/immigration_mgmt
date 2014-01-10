require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test "factory" do
    @emp = FactoryGirl.create(:employee)
    assert_equal(@emp.name,"abc","name does not match")
  end

end
