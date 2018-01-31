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

ActiveRecord::Schema.define(version: 20171026165751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "competition_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "competes", ["competition_id"], name: "index_competes_on_competition_id", using: :btree
  add_index "competes", ["user_id"], name: "index_competes_on_user_id", using: :btree

  create_table "competitions", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.string   "city"
    t.string   "state"
    t.text     "desc"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "skill"
  end

  add_index "competitions", ["user_id"], name: "index_competitions_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "competition_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "messages", ["competition_id"], name: "index_messages_on_competition_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "skill"
  end

  add_foreign_key "competes", "competitions"
  add_foreign_key "competes", "users"
  add_foreign_key "competitions", "users"
  add_foreign_key "messages", "competitions"
  add_foreign_key "messages", "users"
end
