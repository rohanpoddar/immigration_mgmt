class AddIndexes < ActiveRecord::Migration
  def change
    add_index :employees, :number, :unique => true
    add_index :employees, :position

    add_index :visa_types, :name, :unique => true
    add_index :visa_types, :country

    add_index :passports, :number, :unique => true
    add_index :passports, :employee_number, :unique => true

    add_index :visas, :passport_number
    add_index :visas, :visa_type_name

    add_index :immigrations, :city
  end
end
