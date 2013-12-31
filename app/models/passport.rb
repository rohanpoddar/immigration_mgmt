class Passport < ActiveRecord::Base
  attr_accessible :citizenship, :date_of_expiry, :passport_number
end
