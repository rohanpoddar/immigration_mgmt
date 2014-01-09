class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.references :passport
      t.string :visa_type
      t.date :issue_date
      t.date :expiry_date
      t.timestamps
    end
  end
end
