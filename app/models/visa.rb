class VisaValidator < ActiveModel::Validator
  def validate(record)
    if record.expiry_date!=nil&&record.issue_date!=nil
      record.errors[:issue_date]<<"Issue Date comes before Expiry Date" unless record.issue_date<record.expiry_date
    end
  end
end
class Visa < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :expiry_date, :issue_date, :status, :passport_id, :visa_type_id

  #ASSOCIATIONS
  belongs_to :passport
  belongs_to :visa_type
  has_one :immigration, :autosave => true

  #VALIDATIONS
  include ActiveModel::Validations
  validates_presence_of :passport_id
  validates_presence_of :visa_type_id
  validates_presence_of :status
  validates_with VisaValidator

end
