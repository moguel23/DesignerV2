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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150814111141) do

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "customers", ["code"], name: "index_customers_on_code", unique: true
  add_index "customers", ["name"], name: "index_customers_on_name", unique: true

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.string   "device_type"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "site_id"
    t.integer  "customer_id"
  end

  add_index "devices", ["customer_id"], name: "index_devices_on_customer_id"
  add_index "devices", ["product_id"], name: "index_devices_on_product_id"
  add_index "devices", ["site_id"], name: "index_devices_on_site_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "product_type"
    t.integer  "customer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "products", ["customer_id"], name: "index_products_on_customer_id"
  add_index "products", ["name"], name: "index_products_on_name"

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "total_users"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "site_type"
  end

  add_index "sites", ["customer_id"], name: "index_sites_on_customer_id"

end
