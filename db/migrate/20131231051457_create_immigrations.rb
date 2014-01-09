class CreateImmigrations < ActiveRecord::Migration
  def change
    create_table :immigrations do |t|
      t.string :visa_id, :null => false
      t.date :date_of_journey
      t.date :date_of_return
      t.string :city
      t.timestamps
    end
  end
end
