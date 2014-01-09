class Visa < ActiveRecord::Base
  attr_accessible :expiry_date, :issue_date, :visa_type, :status, :passport_number
  belongs_to :passport, :class_name => "Passport", :foreign_key => "passport_number", :primary_key => "passport_number", :polymorphic => true
  has_one :visa_type, :autosave => true
  has_one :immigration, :autosave => true
end
