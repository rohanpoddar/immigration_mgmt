class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|

      t.timestamps
    end
  end
end
