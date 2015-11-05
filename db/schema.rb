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

ActiveRecord::Schema.define(version: 3) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.float   "c_value"
    t.float   "f_value"
    t.float   "m_value"
    t.float   "final_value"
    t.integer "project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.integer "project_type"
    t.integer "position"
    t.float   "init_fault"
    t.integer "user_id"
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

  add_foreign_key "panels", "projects"
  add_foreign_key "projects", "users"
end
