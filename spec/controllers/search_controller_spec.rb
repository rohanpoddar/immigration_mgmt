require 'spec_helper'

describe SearchController do
  describe '#index' do
    it 'renders all the employees as xls format' do
      total_employees = 10
      Employee.should_receive(:count).and_return(total_employees)
      Employee.should_receive(:search).with({"format" => "xls", "controller" => "search", "action" => "index"}, total_employees)
      get :index, :format => :xls
      response.should be_success
      response.content_type.should == "application/vnd.ms-excel"
    end

    it 'renders thirty employees at a time in json format ' do
      Employee.should_receive(:search).with({"format" => "json", "controller" => "search", "action" => "index"}, 30)
      get :index, :format => :json

      response.should be_success
      response.content_type.should == "application/json"
    end

    it 'renders all the employees as html format' do

      get :index
      response.should be_success
      response.content_type.should == "text/html"
    end
  end

end
