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

ActiveRecord::Schema.define(:version => 20120208124252) do

  create_table "demands", :force => true do |t|
    t.string   "product_name"
    t.integer  "period"
    t.integer  "demand_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dependencies", :force => true do |t|
    t.string   "product_name"
    t.string   "follower"
    t.integer  "coefficient"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_solutions", :force => true do |t|
    t.string   "product_name"
    t.integer  "period"
    t.integer  "production_quantity"
    t.integer  "inventory"
    t.boolean  "setup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "product_name"
    t.integer  "leadtime_shift"
    t.string   "resource"
    t.integer  "setup_time"
    t.integer  "setup_cost"
    t.integer  "storage_cost"
    t.integer  "working_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", :force => true do |t|
    t.string   "resource"
    t.integer  "period"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
