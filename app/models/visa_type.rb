class VisaType < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :country, :name

  #ASSOCIATIONS
  has_many :visas
  accepts_nested_attributes_for :visas

  #VALIDATIONS
  validates_uniqueness_of :name
  validates_presence_of :name

end
