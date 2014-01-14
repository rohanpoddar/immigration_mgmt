require 'spec_helper'

describe EmployeesController do
  let(:employee_one) {FactoryGirl.create(:employee)}
  let(:employee_two) {FactoryGirl.create(:employee, employee_number: 121212)}
  let(:employee_three) {FactoryGirl.create(:employee, employee_number: 222222)}

  describe '#index' do
    it 'renders all the employees' do
      Employee.should_receive(:all).and_return([employee_one,employee_two,employee_three])
      get :index
      employees = controller.instance_variable_get(:@employees)
      employees.size.should ==3
    end
  end

  describe '#new' do
    it 'should create an instance of an employee' do
      get :new
      employee = controller.instance_variable_get(:@employee)
      employee.employee_number.should be_nil
      employee.date_of_joining.should be_nil
      employee.name.should be_nil
    end
  end

  describe '#create' do
    it 'should create an employee' do
      get :create
      post :create, employee:{employee_number: 123, name:"emp1", date_of_joining: Time.now}
      response.should redirect_to :action => :index
    end
  end
end