class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports, {:id => false} do |t|
      t.string :passport_number , :null=> false
      t.integer :employee_id , :null=>false
      t.string :citizenship
      t.date :date_of_expiry , :null => false
      t.timestamps
    end
    #PKEY HAS TO BE SET WITH EXECUTE ONLY. RAILS METHOD DOESN'T WORK WITH NON INTEGER STRINGS
    execute "ALTER TABLE passports ADD PRIMARY KEY (passport_number);"
  end
end
