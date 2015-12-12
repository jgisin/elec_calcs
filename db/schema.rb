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

ActiveRecord::Schema.define(version: 20151209210625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cvalues", force: :cascade do |t|
    t.string   "wire_size"
    t.integer  "wire_type"
    t.integer  "conduit_type"
    t.integer  "runs_type"
    t.integer  "c_value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "dryer_demands", force: :cascade do |t|
    t.integer  "count"
    t.float    "demand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "load_demands", force: :cascade do |t|
    t.integer  "unit_count"
    t.float    "demand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meterbanks", force: :cascade do |t|
    t.string   "bus_name"
    t.integer  "unit_count"
    t.string   "largest_unit"
    t.float    "dryer_demand"
    t.float    "load_demand"
    t.integer  "lighting"
    t.integer  "appliance"
    t.integer  "dryer_total"
    t.integer  "hvac_total"
    t.integer  "total_load"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "panels", force: :cascade do |t|
    t.string  "panel_name"
    t.integer "position"
    t.float   "wire_length"
    t.float   "init_fault"
    t.string  "fed_from"
    t.float   "runs"
    t.float   "voltage"
    t.string  "wire_size"
    t.integer "wire_type"
    t.integer "conduit_type"
    t.integer "run_type"
    t.integer "temp"
    t.integer "conn_ampacity"
    t.float   "c_value"
    t.float   "f_value"
    t.float   "m_value"
    t.float   "final_value"
    t.float   "volt_drop"
    t.integer "project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.string  "project_type"
    t.integer "position"
    t.float   "init_fault"
    t.integer "user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string   "unit_name"
    t.integer  "bedrooms"
    t.float    "sqr_ftg"
    t.integer  "small_app"
    t.integer  "washer",     default: 0
    t.integer  "microwave",  default: 0
    t.integer  "dishwasher", default: 0
    t.integer  "disposal",   default: 0
    t.integer  "dryer",      default: 0
    t.integer  "hvac"
    t.integer  "heating",    default: 0
    t.integer  "cooling",    default: 0
    t.integer  "other_load", default: 0
    t.integer  "demand"
    t.integer  "lighting"
    t.integer  "total_unit"
    t.integer  "voltage"
    t.integer  "project_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "voltdrops", force: :cascade do |t|
    t.string   "wire_size"
    t.integer  "wire_type"
    t.integer  "phase"
    t.integer  "conduit"
    t.integer  "power_factor"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "wires", force: :cascade do |t|
    t.string   "wire_size"
    t.integer  "wire_type"
    t.integer  "temp"
    t.integer  "ampacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "meterbanks", "projects"
  add_foreign_key "panels", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "units", "projects"
end
