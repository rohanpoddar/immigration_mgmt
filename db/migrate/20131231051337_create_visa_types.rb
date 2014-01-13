class CreateVisaTypes < ActiveRecord::Migration
  def change
    create_table :visa_types do |t|
      t.string :visa_type, :null => false
      t.string :country
      t.timestamps
    end
    add_index :visa_types, :visa_type, :unique => true
  end
end
