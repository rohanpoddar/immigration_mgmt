class Visa < ActiveRecord::Base
  attr_accessible :expiry_date, :issue_date, :status
  belongs_to :passport
  belongs_to :visa_type
  has_one :immigration, :autosave => true
  validates_presence_of :visa_type
  validates_presence_of :passport
end
