class Immigration < ActiveRecord::Base
  attr_accessible :city, :date_of_journey, :date_of_return
  belongs_to :visa, :foreign_key => 'visa_id'
end
