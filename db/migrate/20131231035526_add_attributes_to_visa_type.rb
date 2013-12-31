class AddAttributesToVisaType < ActiveRecord::Migration
  def change
    add_column :visa_types, :visa_type, :string, :null=>false
    add_column :visa_types, :country, :string
  end
end
