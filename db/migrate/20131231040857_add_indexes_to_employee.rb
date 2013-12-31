class AddIndexesToEmployee < ActiveRecord::Migration
  def change
    add_index :employees, :employee_id, :unique=>true
    add_index :employees, :category
    add_index :employees, :location
    add_index :employees, :first_name
    add_index :employees, :last_name
  end
end
