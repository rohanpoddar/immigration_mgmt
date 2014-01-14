class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.references :employee
      t.string :passport_number , :null=> false
      t.string :citizenship
      t.date :date_of_expiry
      t.timestamps
    end
  end
end
