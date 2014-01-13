class Passport < ActiveRecord::Base
  attr_accessible :citizenship, :date_of_expiry, :passport_number, :employee_id
  belongs_to :employee, :foreign_key => :employee_id
  has_many :visas, :autosave => true
end
