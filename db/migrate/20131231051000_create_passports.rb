class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports, {:id => false} do |t|
      t.string :passport_number , :null=> false
      t.integer :employee_id , :null=>false
      t.string :citizenship
      t.date :date_of_expiry
      t.timestamps
    end
    execute "ALTER TABLE passports ADD PRIMARY KEY (passport_number);"
    add_index :passports, :passport_number, :unique => true
  end
end
