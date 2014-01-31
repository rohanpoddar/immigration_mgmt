class ImmigrationValidator < ActiveModel::Validator
  def validate(record)
    if record.journey_date!=nil&&record.return_date!=nil
      record.errors[:journey_date]<<" Date of Return comes before Date of journey" unless record.journey_date<record.return_date
      record.errors[:journey_date]<<": Date of Joining should be after 1989" unless record.journey_date>Time.zone.local(1989, 1, 1, 0, 0)
      record.errors[:return_date]<<": Date of Return should be after 1989" unless record.return_date>Time.zone.local(1989, 1, 1, 0, 1)
    end
  end
end

class Immigration < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :city, :journey_date, :return_date, :visa_id
  audited

  #ASSOCIATIONS
  belongs_to :visa

  #VALIDATIONS
  include ActiveModel::Validations
  validates_presence_of :visa_id
  validates_with ImmigrationValidator

  #METHODS
end
