class Visa < ActiveRecord::Base
  attr_accessible :expiry_date, :issue_date, :visa_type
  belongs_to :passport
  has_one :visa_type
  has_one :immigration
end
