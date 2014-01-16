class EmployeeValidator < ActiveModel::Validator
  def validate(record)
    #Date Validations
    record.errors[:joining_date]<<": Joining Date should be after 1989" unless record.joining_date.year>=1989  if record.joining_date!=nil
    record.errors[:joining_date]<<": Exit Date comes before Joining Date" unless record.joining_date<=record.exit_date if record.joining_date!=nil && record.exit_date!=nil

  end
end

class Employee < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :category, :joining_date, :number, :exit_date, :name, :location, :position
  self.primary_key = 'number'

  #ASSOCIATIONS
  has_one :passport, :foreign_key => "employee_number", :autosave => true, :dependent => :destroy
  has_many :visas, :through => :passport, :autosave => true
  accepts_nested_attributes_for :passport, :visas

  #VALIDATIONS
  include ActiveModel::Validations
  validates_presence_of :joining_date, :number, :name
  validates_uniqueness_of :number
  validates_with EmployeeValidator

  #METHODS
  def location=(location)
    if location==nil
      write_attribute(:location,"Unknown")
    elsif location.downcase=="blr"
      write_attribute(:location,"Bangalore".upcase)
    else
      write_attribute(:location,location.upcase)
    end
  end

  def self.search(search)
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  end
end

