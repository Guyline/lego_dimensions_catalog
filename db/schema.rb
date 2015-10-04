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

ActiveRecord::Schema.define(version: 20151004025147) do

  create_table "abilities", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "build_abilities", force: :cascade do |t|
    t.integer  "build_id",   limit: 4
    t.integer  "ability_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "builds", force: :cascade do |t|
    t.integer  "figurine_id", limit: 4
    t.string   "name",        limit: 255
    t.integer  "version",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dimensions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "figurine_abilities", force: :cascade do |t|
    t.integer  "figurine_id", limit: 4
    t.integer  "ability_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "figurines", force: :cascade do |t|
    t.integer  "dimension_id",  limit: 4
    t.integer  "owner_id",      limit: 4
    t.string   "name",          limit: 255, null: false
    t.string   "figurine_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "level_abilities", force: :cascade do |t|
    t.integer  "level_id",   limit: 4
    t.integer  "ability_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: :cascade do |t|
    t.integer  "pack_id",      limit: 4
    t.integer  "dimension_id", limit: 4
    t.string   "name",         limit: 255
    t.string   "location",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pack_figurines", force: :cascade do |t|
    t.integer  "pack_id",     limit: 4
    t.integer  "figurine_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packs", force: :cascade do |t|
    t.integer  "wave_id",    limit: 4
    t.string   "name",       limit: 255,                         null: false
    t.integer  "set_number", limit: 4
    t.decimal  "price",                  precision: 5, scale: 2
    t.string   "pack_type",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "waves", force: :cascade do |t|
    t.integer  "number",       limit: 4
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "worlds", force: :cascade do |t|
    t.integer  "dimension_id", limit: 4
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
