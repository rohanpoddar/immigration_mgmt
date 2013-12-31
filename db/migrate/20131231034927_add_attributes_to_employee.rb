class AddAttributesToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :employee_id, :string, :null=>false
    add_column :employees, :first_name, :string, :null=>false
    add_column :employees, :last_name, :string
    add_column :employees, :category, :string
    add_column :employees, :date_of_joining, :date
    add_column :employees, :exit_date, :date
    add_column :employees, :location, :string
  end
end
