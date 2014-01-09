class Passport < ActiveRecord::Base
  attr_accessible :citizenship, :date_of_expiry, :passport_number
  self.primary_key='passport_number'
  belongs_to :employee
  has_many :visas
end
