class AddIndexes < ActiveRecord::Migration
  def change
    add_index :employees, :employee_id
    add_index :employees, :position
    add_index :employees, :location
    add_index :visas, :visa_type_id
    add_index :immigrations, :city
    add_index :visa_types, :country
    add_index :visa_types, :type
  end
end
