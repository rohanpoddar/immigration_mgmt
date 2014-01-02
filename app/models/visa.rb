class Visa < ActiveRecord::Base
  attr_accessible :expiry_date, :issue_date, :visa_id
  has_one :immigration
  belongs_to :passport
  belongs_to :visa_type
end
