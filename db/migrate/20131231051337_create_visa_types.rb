class CreateVisaTypes < ActiveRecord::Migration
  def change
    create_table :visa_types, :id => false, :primary_key => 'type' do |t|
      t.string :type, :null => false
      t.string :country
      t.timestamps
    end
    add_index :visa_types, :type, :unique => true
  end
end
