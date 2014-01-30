# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140130064348) do

  create_table "employees", :id => false, :force => true do |t|
    t.string   "number",                      :null => false
    t.string   "name",                        :null => false
    t.string   "position"
    t.string   "category"
    t.string   "location"
    t.integer  "isDeleted",    :default => 0
    t.date     "joining_date",                :null => false
    t.date     "exit_date"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "employees", ["number"], :name => "index_employees_on_number", :unique => true
  add_index "employees", ["position"], :name => "index_employees_on_position"

  create_table "immigrations", :force => true do |t|
    t.integer  "visa_id"
    t.date     "journey_date"
    t.date     "return_date"
    t.string   "city"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "immigrations", ["city"], :name => "index_immigrations_on_city"

  create_table "passports", :id => false, :force => true do |t|
    t.string   "employee_number",                :null => false
    t.string   "number",                         :null => false
    t.string   "citizenship"
    t.integer  "isDeleted",       :default => 0
    t.date     "expiry_date"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "passports", ["employee_number"], :name => "index_passports_on_employee_number"
  add_index "passports", ["isDeleted"], :name => "index_passports_on_isDeleted"
  add_index "passports", ["number"], :name => "index_passports_on_number", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

  create_table "visa_types", :id => false, :force => true do |t|
    t.string   "name",                      :null => false
    t.string   "country"
    t.integer  "isDeleted",  :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "visa_types", ["country"], :name => "index_visa_types_on_country"
  add_index "visa_types", ["name"], :name => "index_visa_types_on_name", :unique => true

  create_table "visas", :force => true do |t|
    t.string   "passport_number",                :null => false
    t.string   "visa_type_name",                 :null => false
    t.string   "status",                         :null => false
    t.date     "issue_date"
    t.date     "expiry_date"
    t.integer  "isDeleted",       :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "visas", ["isDeleted"], :name => "index_visas_on_isDeleted"
  add_index "visas", ["passport_number"], :name => "index_visas_on_passport_number"
  add_index "visas", ["visa_type_name"], :name => "index_visas_on_visa_type_name"

  add_foreign_key "passports", "employees", name: "passports_employee_number_fk", column: "employee_number", primary_key: "number", dependent: :delete

  add_foreign_key "visas", "passports", name: "visas_passport_number_fk", column: "passport_number", primary_key: "number", dependent: :delete
  add_foreign_key "visas", "visa_types", name: "visas_visa_type_name_fk", column: "visa_type_name", primary_key: "name", dependent: :delete

end
