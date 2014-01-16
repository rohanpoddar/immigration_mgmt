require 'foreigner'
class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key(:passports, :employees, column: 'employee_number', :primary_key => 'number', dependent: :delete)
    add_foreign_key(:visas, :passports, column: 'passport_number', :primary_key => 'number', dependent: :delete)
    add_foreign_key(:visas, :visa_types, column: 'visa_type_name', :primary_key => 'name', dependent: :delete)
  end
end
