require 'foreigner'
class AddForeignKeys < ActiveRecord::Migration
  def up
    add_foreign_key(:passports, :employees, column: 'employee_id', :primary_key => 'employee_id', dependent: :delete)
    #add_foreign_key(:visas, :passports, column: 'passport_number', :primary_key => 'passport_number', options:"ON DELETE CASCADE")
    #add_foreign_key(:visas, :visa_types, column: 'visa_type', :primary_key => 'visa_type', options:"ON DELETE CASCADE")
    #add_foreign_key(:immigrations, :visas, dependent: :delete)
    #add_foreign_key(:visas, :visa_types)
  end
#
  def down
#    remove_foreign_key(:passports, :employees)
#    remove_foreign_key(:visas, :passports)
#    remove_foreign_key(:visas, :visa_types)
#    remove_foreign_key(:immigrations, :visas)
  end
end
