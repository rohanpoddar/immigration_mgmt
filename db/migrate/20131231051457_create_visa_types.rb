class CreateVisaTypes < ActiveRecord::Migration
  def change
    create_table :visa_types do |t|
      t.string :type
      t.string :country
      t.timestamps
    end
  end
end
