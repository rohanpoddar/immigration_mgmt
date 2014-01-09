require 'foreigner'
class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key(:passports, :employees, column: 'employee_id', :primary_key => 'employee_id', dependent: :delete)
    add_foreign_key(:visas, :passports, column: 'passport_id', :primary_key => 'passport_number', dependent: :delete)
    add_foreign_key(:visas, :visa_types, column: 'visa_type_id', :primary_key => 'visa_type', dependent: :delete)
  end
end
