class Employee < ActiveRecord::Base
  attr_accessible :category, :date_of_joining, :employee_id, :exit_date, :first_name, :last_name, :location, :position
end
