class Visa < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :expiry_date, :issue_date, :status, :passport_id, :visa_type_id

  #ASSOCIATIONS
  belongs_to :passport
  belongs_to :visa_type
  has_one :immigration, :autosave => true

  #VALIDATIONS
  validates_presence_of :passport_id
  validates_presence_of :visa_type_id
  validates_presence_of :status

end
