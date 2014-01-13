class Immigration < ActiveRecord::Base
  attr_accessible :city, :date_of_journey, :date_of_return, :visa_id
  belongs_to :visa
  validates_presence_of :visa
  validates_uniqueness_of :visa_id
end
