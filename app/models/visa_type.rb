class VisaType < ActiveRecord::Base
  attr_accessible :country, :visa_type
  has_many :visas
end
