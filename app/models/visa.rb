class Visa < ActiveRecord::Base
  attr_accessible :epiry_date, :issue_date, :visa_id
end
