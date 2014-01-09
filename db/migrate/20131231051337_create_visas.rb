class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.belongs_to :passport
      t.has_one :visa_type
      t.string :visa_id, :null => false , :unique => true
      t.date :issue_date
      t.date :expiry_date
      t.timestamps
    end
  end
end
