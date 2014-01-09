class VisaType < ActiveRecord::Base
  attr_accessible :country, :visa_type
  has_many :visas
  self.primary_key = "visa_type"
end
