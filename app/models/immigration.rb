class ImmigrationValidator < ActiveModel::Validator
  def validate(record)
    if record.date_of_journey!=nil&&record.date_of_return!=nil
      record.errors[:date_of_journey]<<"Return Date comes before Date of journey" unless record.date_of_journey<record.date_of_return
    end
  end
end

class Immigration < ActiveRecord::Base

  #ATTRIBUTES
  attr_accessible :city, :date_of_journey, :date_of_return, :visa_id

  #ASSOCIATIONS
  belongs_to :visa

  #VALIDATIONS
  include ActiveModel::Validations
  validates_presence_of :visa_id
  validates_with ImmigrationValidator
end
