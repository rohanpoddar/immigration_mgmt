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

ActiveRecord::Schema.define(:version => 20131231040857) do

  create_table "employees", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "employee_id",     :null => false
    t.string   "first_name",      :null => false
    t.string   "last_name"
    t.string   "category"
    t.date     "date_of_joining"
    t.date     "exit_date"
    t.string   "location"
  end

  add_index "employees", ["category"], :name => "index_employees_on_category"
  add_index "employees", ["employee_id"], :name => "index_employees_on_employee_id", :unique => true
  add_index "employees", ["first_name"], :name => "index_employees_on_first_name"
  add_index "employees", ["last_name"], :name => "index_employees_on_last_name"
  add_index "employees", ["location"], :name => "index_employees_on_location"

  create_table "immigrations", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "visa_id",         :null => false
    t.date     "date_of_journey"
    t.date     "date_of_return"
    t.string   "city"
  end

  create_table "passports", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "passport_number", :null => false
    t.string   "employee_id",     :null => false
    t.string   "citizenship",     :null => false
    t.date     "date_of_expiry"
  end

  create_table "visa_types", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "visa_type",  :null => false
    t.string   "country"
  end

  create_table "visas", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "visa_id",     :null => false
    t.string   "visa_type",   :null => false
    t.date     "issue_date"
    t.date     "expiry_date"
    t.string   "employee_id", :null => false
  end

end
