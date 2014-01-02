class VisaType < ActiveRecord::Base
  attr_accessible :country, :type
  has_many :visas
end
