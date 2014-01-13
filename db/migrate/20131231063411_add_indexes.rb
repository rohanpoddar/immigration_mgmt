class AddIndexes < ActiveRecord::Migration
  def change
    add_index :immigrations, :city
    add_index :visa_types, :country
  end
end
