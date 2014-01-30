class Passport < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :number, :employee_number, :citizenship, :expiry_date
  self.primary_key = 'number'

  #ASSOCIATIONS
  belongs_to :employee, :foreign_key => "employee_number", :primary_key => "number", :autosave => true
  has_many :visas, :foreign_key => "passport_number", :autosave => true
  has_many :current_visas, :class_name => 'Passport', :foreign_key => 'employee_number', :conditions => {:isDeleted => 0}
  has_many :removed_visas, :class_name => 'Passport', :foreign_key => 'employee_number', :conditions => {:isDeleted => 1}
  has_one :passport, :class_name => 'Passport', :foreign_key => 'employee_number'
  accepts_nested_attributes_for :visas

  #VALIDATIONS
  validates_associated :employee
  validates_uniqueness_of :number
  validates_presence_of :number

  #METHODS
  def isExpired?
    (self.expiry_date!=nil) ? self.expiry_date.beginning_of_day<Date.today : false
  end

  def monthsLeftToExpire
    currentTime=Date.today
    expiryTime=self.expiry_date
    #Approximate calculation. Needs to be revisited
    (expiryTime.year-currentTime.year)*12+(expiryTime.month-currentTime.month)
  end


  def delete
    self.isDeleted=1
    self.visas.each do |visa|
      visa.delete
    end
  end

  def delete!
    self.delete
    self.save!
  end

  def isDeleted?
    self.isDeleted==1
  end

end
