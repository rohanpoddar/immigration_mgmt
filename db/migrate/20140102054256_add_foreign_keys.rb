class AddForeignKeys < ActiveRecord::Migration
  def up
    add_foreign_key(:passports, :employees, options:"ON DELETE CASCADE")
    add_foreign_key(:visas, :passports, options:"ON DELETE CASCADE")
    add_foreign_key(:visas, :visa_types, options:"ON DELETE CASCADE")
    add_foreign_key(:immigrations, :visas, dependent: :delete)
  end

  def down
    remove_foreign_key(:passports, :employees)
    remove_foreign_key(:visas, :passports)
    remove_foreign_key(:visas, :visa_types)
    remove_foreign_key(:immigrations, :visas)
  end
end
