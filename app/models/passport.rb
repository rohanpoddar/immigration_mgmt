class Passport < ActiveRecord::Base
  attr_accessible :citizenship, :date_of_expiry, :passport_number, :employee_id
  self.primary_key = 'passport_number'
  belongs_to :employee, :foreign_key => 'employee_id'
  has_many :visas, :autosave => true
end
