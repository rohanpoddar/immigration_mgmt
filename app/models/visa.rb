class Visa < ActiveRecord::Base
  attr_accessible :expiry_date, :issue_date, :visa_type_id, :status, :passport_id
  belongs_to :passport, :foreign_key => 'passport_id'
  belongs_to :visa_type, :foreign_key => 'visa_type_id'
  has_one :immigration, :autosave => true
end
