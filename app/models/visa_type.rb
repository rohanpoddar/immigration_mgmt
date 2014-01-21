class VisaType < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :country, :name
  self.primary_key = 'name'

  #ASSOCIATIONS
  has_many :visas, :foreign_key => "visa_type_name"
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
