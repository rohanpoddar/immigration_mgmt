class CreatePassports < ActiveRecord::Migration
  def up
    create_table :passports do |t|
      t.string :passport_number
      t.string :citizenship
      t.date :date_of_expiry
      t.timestamps
    end
  end

  def down
  end
end
