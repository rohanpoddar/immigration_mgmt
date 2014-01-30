require 'spec_helper'

describe PassportsController do
  let(:passport_one) { FactoryGirl.create(:passport) }
  let(:employee) { FactoryGirl.create(:employee, number: "1212") }
  let(:passport_two) { FactoryGirl.create(:passport, number: 'p1234', employee: employee) }

  describe '#index' do
    it 'should render all passports as json' do
      get :index, :format => :json

      response.should be_success
    end
  end

  describe '#new' do
    it 'should create an instance of passport' do
      get :new
      passport = controller.instance_variable_get(:@passport)
      passport.number.should be_nil
    end
  end

  describe '#create' do
    it 'should create passport ' do
      post :create, passport: {number: 'p123', expiry_date: Time.now, employee_number: employee.number}
      response.should redirect_to :action => :index
    end
  end

  describe '#update' do
    it 'should update passport ' do
      Passport.should_receive(:find_by_number).with('123').and_return(passport_two)
      put :update, id: '123', passport: {number: 'p123', expiry_date: Time.now, employee_number: employee.number}
      updated_passport = controller.instance_variable_get(:@passport)
      updated_passport.number.should == 'p123'
      response.should redirect_to show_passport_path
    end
  end

  describe '#remove' do
    it 'should delete passport' do
      Passport.should_receive(:find_by_number).with(passport_one.number.to_s).and_return(passport_one)
      put :remove, id: passport_one.number.to_s
      response.should redirect_to :action => :index
    end

  end

  describe '#show' do
    it 'should show all the information of particular passport' do
      Passport.should_receive(:find_by_number).with('pass1234').and_return(passport_two)
      get :show, id: 'pass1234'
      passport= controller.instance_variable_get(:@passport)
      passport.number.should == 'p1234'
    end
  end

end