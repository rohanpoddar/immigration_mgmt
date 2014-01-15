class EmployeeValidator < ActiveModel::Validator
  def validate(record)
    if record.exit_date!=nil
      record.errors[:date_of_joining]<<": Exit Date comes before Date of joining" unless record.date_of_joining<record.exit_date
    end
  end
end

class Employee < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :category, :date_of_joining, :employee_number, :exit_date, :name, :location, :position

  #ASSOCIATIONS
  has_one :passport, :autosave => true, :dependent => :destroy
  has_many :visas, :through => :passport, :autosave => true
  accepts_nested_attributes_for :passport, :visas

  #VALIDATIONS
  include ActiveModel::Validations
  validates_uniqueness_of :employee_number
  validates_presence_of :date_of_joining, :employee_number, :name
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

