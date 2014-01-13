class Passport < ActiveRecord::Base
  attr_accessible :citizenship, :date_of_expiry, :passport_number, :employee_id
  belongs_to :employee
  has_many :visas, :autosave => true
  validates_uniqueness_of :passport_number
  validates_associated :employee
  validates_presence_of :employee_id
end
