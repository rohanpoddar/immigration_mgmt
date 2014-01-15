class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :passport_number, :null => false
      t.references :visa_type
      t.string :status, :null => false
      t.date :issue_date
      t.date :expiry_date
      t.timestamps
    end
  end
end
