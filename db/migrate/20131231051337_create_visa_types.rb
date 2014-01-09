class CreateVisaTypes < ActiveRecord::Migration
  def change
    create_table :visa_types, :id => false do |t|
      t.string :type, :null => false
      t.string :country
      t.timestamps
    end
  end
end
