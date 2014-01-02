class Employee < ActiveRecord::Base
  attr_accessible :category, :date_of_joining, :employee_id, :exit_date, :name, :location, :position
  has_one :passport, :dependent => :destroy
  has_many :visas, :through => :passports
  validates_uniqueness_of :employee_id

end
