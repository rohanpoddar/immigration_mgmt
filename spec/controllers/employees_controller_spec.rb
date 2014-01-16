require 'spec_helper'

describe EmployeesController do
  let(:employee_one) { FactoryGirl.create(:employee) }
  let(:employee_two) { FactoryGirl.create(:employee, number: 121212) }
  let(:employee_three) { FactoryGirl.create(:employee, number: 222222) }

  describe '#index' do
    it 'renders all the employees' do
      Employee.should_receive(:all).and_return([employee_one, employee_two, employee_three])
      get :index
      employees = controller.instance_variable_get(:@employees)
      employees.size.should ==3
    end
  end

  describe '#new' do
    it 'should create an instance of an employee' do
      get :new
      employee = controller.instance_variable_get(:@employee)
      employee.number.should be_nil
      employee.joining_date.should be_nil
      employee.name.should be_nil
    end
  end

  describe '#create' do
    it 'should create an employee' do
      get :create
      post :create, employee: {number: 123, name: "emp1", joining_date: Time.now},commit:"SAVE"
      response.should redirect_to :action => :index
    end
  end

  describe '#update' do
    it 'should update employee ' do
      Employee.should_receive(:find_by_number).with('12343').and_return(employee_one)
      put :update, id: '12343', employee: {name: 'new_name'}, commit: "SAVE"
      updated_employee = controller.instance_variable_get(:@employee)
      updated_employee.name.should == 'new_name'
      response.should redirect_to :action => :index
    end
  end

  describe '#destroy' do
    it 'should delete passport' do
      Employee.should_receive(:find_by_number).with(employee_one.number.to_s).and_return(employee_one)
      delete :destroy, id: employee_one.number
      response.should redirect_to :action => :index
    end

  end
end