class AddAttributesToImmigration < ActiveRecord::Migration
  def change
    add_column :immigrations, :visa_id, :string, :null=>false
    add_column :immigrations, :date_of_journey, :date
    add_column :immigrations, :date_of_return, :date
    add_column :immigrations, :city, :string
  end
end
