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

ActiveRecord::Schema.define(version: 20170726184443) do

  create_table "Summits", force: :cascade do |t|
    t.string   "osm_id"
    t.string   "name"
    t.integer  "elevation"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "climb_records", force: :cascade do |t|
    t.decimal  "elevation_gain"
    t.integer  "activity_id"
    t.integer  "start_time"
    t.integer  "end_time"
    t.integer  "total_time"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "activity_name"
  end

  add_index "climb_records", ["user_id"], name: "index_climb_records_on_user_id"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "indexed_activities", force: :cascade do |t|
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "indexed_activities", ["user_id"], name: "index_indexed_activities_on_user_id"

  create_table "list_participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "summit_completions", force: :cascade do |t|
    t.string   "summit"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "activity_id"
    t.integer  "osm_summit_id",        limit: 8
    t.integer  "osm_summit_elevation"
    t.float    "osm_summit_lat"
    t.float    "osm_summit_lon"
    t.integer  "user_id"
    t.datetime "date"
    t.string   "activity_name"
  end

  add_index "summit_completions", ["user_id"], name: "index_summit_completions_on_user_id"

  create_table "summit_in_lists", force: :cascade do |t|
    t.integer  "summit_id"
    t.integer  "summit_list_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "summit_in_lists", ["summit_id"], name: "index_summit_in_lists_on_summit_id"
  add_index "summit_in_lists", ["summit_list_id"], name: "index_summit_in_lists_on_summit_list_id"

  create_table "summit_lists", force: :cascade do |t|
    t.string   "list_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "token"
    t.integer  "strava_id"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
