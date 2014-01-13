class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.string :passport_number , :null=> false
      t.references :employee
      t.string :citizenship
      t.date :date_of_expiry
      t.timestamps
    end
    add_index :passports, :passport_number, :unique => true
  end
end
