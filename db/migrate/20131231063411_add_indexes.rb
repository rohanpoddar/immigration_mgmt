class AddIndexes < ActiveRecord::Migration
  def change
    add_index :employees, :employee_number, :unique => true
    add_index :employees, :position

    add_index :visa_types, :name, :unique => true
    add_index :visa_types, :country

    add_index :passports, :passport_number, :unique => true
    add_index :passports, :employee_number, :unique => true

    add_index :visas, :passport_number
    add_index :visas, :visa_type_id

    add_index :immigrations, :city
  end
end
