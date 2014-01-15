class Passport < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :citizenship, :date_of_expiry, :passport_number, :employee_number
  self.primary_key = 'passport_number'

  #ASSOCIATIONS
  belongs_to :employee, :foreign_key => "employee_number",:primary_key => "employee_number", :autosave => true
  has_many :visas, :foreign_key => "passport_number", :autosave => true
  accepts_nested_attributes_for :visas

  #VALIDATIONS
  validates_uniqueness_of :passport_number, :employee_number
  validates_presence_of :passport_number, :employee_number
end
