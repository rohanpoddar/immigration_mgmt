class CreateVisaTypes < ActiveRecord::Migration
  def change
    create_table :visa_types, {:id => false } do |t|
      t.string :name, :null => false
      t.string :country
      t.timestamps
    end
    execute "ALTER TABLE visa_types ADD PRIMARY KEY (name);"
  end
end
