class CreateEmployees < ActiveRecord::Migration
  def up
    create_table :employees do |t|
      t.string :employee_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :position
      t.string :category
      t.date :doj, null: false
      t.string :exit_date
      t.string :location
      t.timestamps
    end
  end

  def down
  end
end
