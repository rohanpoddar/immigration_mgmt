class CreateVisaTypes < ActiveRecord::Migration
  def change
    create_table :visa_types do |t|

      t.timestamps
    end
  end
end
