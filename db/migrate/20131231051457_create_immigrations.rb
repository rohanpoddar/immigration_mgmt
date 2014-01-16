class CreateImmigrations < ActiveRecord::Migration
  def change
    create_table :immigrations do |t|
      t.references :visa
      t.date :journey_date
      t.date :return_date
      t.string :city
      t.timestamps
    end
  end
end
