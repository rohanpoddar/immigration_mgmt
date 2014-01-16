class Passport < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :number, :employee_number, :citizenship, :expiry_date
  self.primary_key = 'number'

  #ASSOCIATIONS
  belongs_to :employee, :foreign_key => "employee_number",:primary_key => "number", :autosave => true
  has_many :visas, :foreign_key => "passport_number", :autosave => true
  accepts_nested_attributes_for :visas

  #VALIDATIONS
  validates_associated :employee
  validates_uniqueness_of :number
  validates_presence_of :number

  #METHODS
  def isExpired?
    if self.expiry_date<Time.now
      true
    else
      false
    end
  end

  def monthsLeftToExpire
    currentTime=Time.now
    expiryTime=self.expiry_date
    #Approximate calculation. Needs to be revisited
    monthsLeft=(expiryTime.year-currentTime.year)*12+(expiryTime.month-currentTime.month)
    return monthsLeft
  end
end
