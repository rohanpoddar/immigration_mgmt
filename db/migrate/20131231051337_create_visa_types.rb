class CreateVisaTypes < ActiveRecord::Migration
  def change
    create_table :visa_types, {:id => false} do |t|
      t.string :visa_type, :null => false
      t.string :country
      t.timestamps
    end
    execute "ALTER TABLE visa_types ADD PRIMARY KEY (visa_type);"
    add_index :visa_types, :visa_type, :unique => true
  end
end
