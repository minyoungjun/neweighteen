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

ActiveRecord::Schema.define(version: 20150715024956) do

  create_table "admins", force: :cascade do |t|
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fbvideos", force: :cascade do |t|
    t.string   "video_id"
    t.string   "url"
    t.integer  "category_id"
    t.boolean  "hided",       default: false
    t.integer  "sort_number"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "fbvideos", ["url"], name: "index_fbvideos_on_url", unique: true

  create_table "tubes", force: :cascade do |t|
    t.string   "video_id"
    t.integer  "category_id"
    t.boolean  "hided",       default: false
    t.integer  "sort_number"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "tubes", ["video_id"], name: "index_tubes_on_video_id", unique: true

end
