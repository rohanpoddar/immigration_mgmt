class AddAttributesToVisa < ActiveRecord::Migration
  def change
    add_column :visas, :visa_id, :string, :null=>false
    add_column :visas, :visa_type, :string, :null=>false
    add_column :visas, :issue_date, :date
    add_column :visas, :expiry_date, :date
    add_column :visas, :employee_id, :string, :null=>false
  end
end
