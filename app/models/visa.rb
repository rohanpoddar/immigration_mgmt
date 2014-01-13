class Visa < ActiveRecord::Base
  attr_accessible :expiry_date, :issue_date, :status, :passport_id, :visa_type_id
  belongs_to :passport
  belongs_to :visa_type
  has_one :immigration, :autosave => true
  validates_associated :visa_type
  validates_presence_of :visa_type_id
  validates_associated :passport
  validates_presence_of :passport_id
end
