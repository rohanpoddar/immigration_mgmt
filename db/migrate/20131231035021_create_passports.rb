class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|

      t.timestamps
    end
  end
end
