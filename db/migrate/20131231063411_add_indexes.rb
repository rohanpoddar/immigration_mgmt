class AddIndexes < ActiveRecord::Migration
  def change
    add_index :visas, :visa_type
    add_index :immigrations, :city
    add_index :visa_types, :country
    add_index :visa_types, :type, :unique => true
  end
end
