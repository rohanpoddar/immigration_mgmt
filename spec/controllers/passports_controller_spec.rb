require 'spec_helper'

describe PassportsController do
  let(:passport_one) {FactoryGirl.create(:passport)}
  let(:employee) {FactoryGirl.create(:employee, employee_number: 1212)}
  let(:passport_two) {FactoryGirl.create(:passport,passport_number: 'p1234', employee: employee)}

  describe '#index' do
    it 'should display all passports'do
      Passport.should_receive(:all).and_return([passport_one,passport_two])
      get :index
      passports = controller.instance_variable_get(:@passports)
      passports.size.should == 2
    end
  end

  describe '#new' do
    it 'should create an instance of passport'do
      get :new
      passport = controller.instance_variable_get(:@passport)
      passport.passport_number.should be_nil
    end
  end

  describe '#create' do
    it 'should create passport ' do
      post :create,passport: {passport_number: 'p123', date_of_expiry: Time.now, employee_number: employee.employee_number}
      response.should redirect_to :action => :index
    end
  end

  describe '#update' do
    it 'should update passport ' do
      Passport.should_receive(:find_by_passport_number).with('123').and_return(passport_two)
      put :update,id:'123',passport: {passport_number: 'p123', date_of_expiry: Time.now, employee_number: employee.employee_number}
      updated_passport = controller.instance_variable_get(:@passport)
      updated_passport.passport_number.should == 'p123'
      response.should redirect_to :action => :index
    end
  end

  describe '#destroy' do
    it 'should delete passport' do
      Passport.should_receive(:find_by_passport_number).with(passport_one.passport_number.to_s).and_return(passport_one)
      delete :destroy, id:passport_one.passport_number.to_s
      response.should redirect_to :action => :index
    end

  end

end