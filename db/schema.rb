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

ActiveRecord::Schema.define(version: 20151213194063) do

  create_table "addresses", force: :cascade do |t|
    t.string   "country",       limit: 255,                          null: false
    t.string   "zip",           limit: 255,                          null: false
    t.string   "city",          limit: 255,                          null: false
    t.string   "street",        limit: 255,                          null: false
    t.decimal  "lat",                       precision: 10, scale: 6, null: false
    t.decimal  "lon",                       precision: 10, scale: 6, null: false
    t.integer  "restaurant_id", limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "addresses", ["restaurant_id"], name: "index_addresses_on_restaurant_id", using: :btree

  create_table "days_of_week", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "number",        limit: 255, null: false
    t.integer  "restaurant_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "phone_numbers", ["restaurant_id"], name: "index_phone_numbers_on_restaurant_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "review_id",          limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "photos", ["review_id"], name: "index_photos_on_review_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "kitchen",    limit: 4, null: false
    t.integer  "interior",   limit: 4, null: false
    t.integer  "service",    limit: 4, null: false
    t.integer  "review_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "ratings", ["review_id"], name: "index_ratings_on_review_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "website",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title",         limit: 255,   null: false
    t.text     "critique",      limit: 65535, null: false
    t.integer  "restaurant_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "reviews", ["restaurant_id"], name: "index_reviews_on_restaurant_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "timetables", force: :cascade do |t|
    t.string   "start_time",     limit: 255, null: false
    t.string   "end_time",       limit: 255, null: false
    t.integer  "day_of_week_id", limit: 4
    t.integer  "restaurant_id",  limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "timetables", ["day_of_week_id"], name: "index_timetables_on_day_of_week_id", using: :btree
  add_index "timetables", ["restaurant_id"], name: "index_timetables_on_restaurant_id", using: :btree

end
