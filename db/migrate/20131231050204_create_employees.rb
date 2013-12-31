class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_id
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :category
      t.date :date_of_joining
      t.date :exit_date
      t.string :location

      t.timestamps
    end
  end
end
