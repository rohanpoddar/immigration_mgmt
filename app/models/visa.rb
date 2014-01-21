class VisaValidator < ActiveModel::Validator
  def validate(record)
    if record.expiry_date!=nil&&record.issue_date!=nil
      record.errors[:issue_date]<<"Issue Date comes before Expiry Date" unless record.issue_date<record.expiry_date
    end
  end
end
class Visa < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :expiry_date, :issue_date, :status, :passport_number, :visa_type_name

  #ASSOCIATIONS
  belongs_to :passport, :foreign_key => "passport_number", :primary_key => "number"
  belongs_to :visa_type, :foreign_key => "visa_type_name", :primary_key => "name"
  has_one :immigration, :autosave => true

  #VALIDATIONS
  include ActiveModel::Validations
  validates_presence_of :status
  validates_associated :passport
  validates_associated :visa_type
  validates_with VisaValidator

  #METHODS
  def isExpired?
    self.expiry_date<=Time.now
  end

  def monthsLeftToExpire
    currentTime=Time.now
    expiryTime=self.expiry_date
    #Approximate calculation. Needs to be revisited
    (expiryTime.year-currentTime.year)*12+(expiryTime.month-currentTime.month)
  end

  def delete
    self.isDeleted=1
  end

  def delete!
    self.delete
    self.save!
  end

  def isDeleted?
    self.isDeleted==1
  end
end
