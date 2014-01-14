class Passport < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :citizenship, :date_of_expiry, :passport_number, :employee_id

  #ASSOCIATIONS
  belongs_to :employee, :foreign_key => 'employee_id', :autosave => true
  has_many :visas, :autosave => true
  accepts_nested_attributes_for :visas

  #VALIDATIONS
  validates_uniqueness_of :passport_number
  validates_presence_of :employee_id
  validates_uniqueness_of :employee_id
end
