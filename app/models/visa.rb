class Visa < ActiveRecord::Base
  attr_accessible :epiry_date, :issue_date, :visa_id
  belongs_to :visa, :foreign_key => 'passport_id'
  belongs_to :visa_type, :foreign_key => 'visa_type_id'
  belongs_to :employee, :through => :passport
end
