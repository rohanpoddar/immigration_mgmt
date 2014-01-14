class Employee < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :category, :date_of_joining, :employee_number, :exit_date, :name, :location, :position

  #ASSOCIATIONS
  has_one :passport, :autosave => true, :dependent => :destroy
  has_many :visas, :through => :passport, :autosave => true
  accepts_nested_attributes_for :passport, :visas

  #VALIDATIONS
  validates_uniqueness_of :employee_number
  validates_presence_of :date_of_joining, :employee_number, :name

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
