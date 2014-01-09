class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees, {:id => false} do |t|
      t.integer :employee_id, :null => false
      t.string :name, :null => false
      t.string :position, :null => false
      t.string :category, :null => false
      t.date :date_of_joining, :null => false
      t.string :location, :null => false
      t.date :exit_date
      t.timestamps
    end
    #PKEY HAS TO BE SET WITH EXECUTE ONLY. RAILS METHOD DOESN'T WORK WITH NON INTEGER STRINGS
    execute "ALTER TABLE employees ADD PRIMARY KEY (employee_id);"
    add_index :employees, :position
  end
end
