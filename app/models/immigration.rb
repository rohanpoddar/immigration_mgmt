class Immigration < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :city, :date_of_journey, :date_of_return, :visa_id

  #ASSOCIATIONS
  belongs_to :visa

  #VALIDATIONS
  validates_presence_of :visa_id
end
