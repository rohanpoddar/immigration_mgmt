class VisaType < ActiveRecord::Base
  attr_accessible :country, :visa_type
  has_many :visas
  validates_uniqueness_of :visa_type
end
