class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :employee_id, :null => false, :unique => true
      t.string :name, :null => false
      t.string :position, :null => false
      t.string :category, :null => false
      t.date :date_of_joining, :null => false
      t.string :location, :null => false
      t.date :exit_date
      t.timestamps
    end
  end
end
