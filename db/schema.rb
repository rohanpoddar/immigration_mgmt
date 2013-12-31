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

ActiveRecord::Schema.define(:version => 20131231063411) do

  create_table "employees", :force => true do |t|
    t.string   "employee_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.string   "category"
    t.date     "date_of_joining"
    t.date     "exit_date"
    t.string   "location"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "employees", ["employee_id"], :name => "index_employees_on_employee_id"
  add_index "employees", ["location"], :name => "index_employees_on_location"
  add_index "employees", ["position"], :name => "index_employees_on_position"

  create_table "immigrations", :force => true do |t|
    t.integer  "visa_id"
    t.date     "date_of_journey"
    t.date     "date_of_return"
    t.string   "city"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "passports", :force => true do |t|
    t.integer  "employee_id"
    t.string   "passport_number"
    t.string   "citizenship"
    t.date     "date_of_expiry"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "visa_types", :force => true do |t|
    t.string   "visa_type"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "visas", :force => true do |t|
    t.integer  "passport_id"
    t.integer  "visa_type_id"
    t.string   "visa_id"
    t.date     "issue_date"
    t.date     "expiry_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "visas", ["visa_type_id"], :name => "index_visas_on_visa_type_id"

end
