class AddAttributesToPassport < ActiveRecord::Migration
  def change
    add_column :passports, :passport_number, :string, :null=>false
    add_column :passports, :employee_id, :string, :null=>false
    add_column :passports, :citizenship, :string, :null=>false
    add_column :passports, :date_of_expiry, :date
  end
end
