class VisaType < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :country, :name
  self.primary_key = 'name'
  audited

  #ASSOCIATIONS
  has_many :visas, :foreign_key => "visa_type_name"
  has_one :deleted_visas, :class_name => 'Visa', :foreign_key => 'visa_type_name', :conditions => {:isDeleted => 1}
  accepts_nested_attributes_for :visas

  #VALIDATIONS
  validates_uniqueness_of :name
  validates_presence_of :name

  #METHODS

  def delete!
    self.isDeleted=1
    self.visas.each do |visa|
      visa.delete
    end
    self.save!
  end

  def isDeleted?
    self.isDeleted==1
  end

end
