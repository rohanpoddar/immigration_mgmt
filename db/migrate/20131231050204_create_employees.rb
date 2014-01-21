class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees ,{:id=> false} do |t|
      t.integer :number, :null => false
      #remove_column :employees, :id
      t.string :name, :null => false
      t.string :position
      t.string :category
      t.string :location
      t.integer :isDeleted, :default=>0
      t.date :joining_date, :null => false
      t.date :exit_date
      t.timestamps
    end
      execute "ALTER TABLE employees ADD PRIMARY KEY (number);"
  end
end
