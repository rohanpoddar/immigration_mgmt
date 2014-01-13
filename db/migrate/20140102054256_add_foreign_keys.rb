require 'foreigner'
class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key(:passports, :employees, dependent: :delete)
    add_foreign_key(:visas, :passports, dependent: :delete)
    add_foreign_key(:visas, :visa_types,dependent: :delete)
  end
end
