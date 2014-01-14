class CreateVisaTypes < ActiveRecord::Migration
  def change
    create_table :visa_types do |t|
      t.string :name, :null => false
      t.string :country
      t.timestamps
    end
  end
end
