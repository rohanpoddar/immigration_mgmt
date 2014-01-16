class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports,{:id => false} do |t|
      t.integer :employee_number, :null =>false
      t.string :number , :null => false
      t.string :citizenship
      t.date :expiry_date
      t.timestamps
    end
      execute "ALTER TABLE passports ADD PRIMARY KEY (number);"
  end
end
