class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :visa_type_id, :null => false
      t.string :passport_id, :null => false
      t.string :status, :null => false
      t.date :issue_date
      t.date :expiry_date
      t.timestamps
    end
  end
end
