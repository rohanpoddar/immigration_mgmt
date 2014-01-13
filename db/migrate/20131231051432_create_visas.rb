class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.references :visa_type
      t.references :passport
      t.string :status, :null => false
      t.date :issue_date
      t.date :expiry_date
      t.timestamps
    end
  end
end
