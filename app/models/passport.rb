class Passport < ActiveRecord::Base
  attr_accessible :citizenship, :date_of_expiry, :passport_number
  belongs_to :employee, :foreign_key => 'employee_id'
  has_many :visas, :dependent => :destroy
end
