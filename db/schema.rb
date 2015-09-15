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

ActiveRecord::Schema.define(version: 20150915094625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "athlete_wod_log_movements", force: :cascade do |t|
    t.integer "athlete_wod_log_id",              null: false
    t.integer "workout_movement_id",             null: false
    t.integer "reps",                default: 0, null: false
    t.integer "weight_kilos",        default: 0, null: false
    t.integer "distance_meters",     default: 0, null: false
    t.integer "height_meters",       default: 0, null: false
    t.integer "time_seconds",        default: 0, null: false
  end

  add_index "athlete_wod_log_movements", ["athlete_wod_log_id", "workout_movement_id"], name: "index_athlete_wod_log_movements_unique", unique: true, using: :btree
  add_index "athlete_wod_log_movements", ["athlete_wod_log_id"], name: "index_athlete_wod_log_movements_on_athlete_wod_log_id", using: :btree
  add_index "athlete_wod_log_movements", ["workout_movement_id"], name: "index_athlete_wod_log_movements_on_workout_movement_id", using: :btree

  create_table "athlete_wod_logs", force: :cascade do |t|
    t.integer  "athlete_wod_id", null: false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "athlete_wods", force: :cascade do |t|
    t.integer  "trainer_id", null: false
    t.integer  "athlete_id", null: false
    t.integer  "workout_id", null: false
    t.date     "date",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "athlete_wods", ["athlete_id", "date"], name: "index_athlete_wods_on_athlete_id_and_date", unique: true, using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "member_id",  null: false
    t.integer  "team_id",    null: false
    t.string   "role",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["member_id"], name: "index_memberships_on_member_id", using: :btree
  add_index "memberships", ["team_id", "member_id"], name: "index_memberships_on_team_id_and_member_id", unique: true, using: :btree

  create_table "movements", force: :cascade do |t|
    t.integer "owner_id"
    t.string  "title",                         null: false
    t.integer "reps",            default: 0,   null: false
    t.decimal "weight_kilos",    default: 0.0, null: false
    t.decimal "distance_meters", default: 0.0, null: false
    t.decimal "height_meters",   default: 0.0, null: false
    t.integer "time_seconds",    default: 0,   null: false
  end

  add_index "movements", ["title"], name: "index_movements_on_title", unique: true, using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "slug",       null: false
    t.integer  "owner_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "phone",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "pin",              null: false
    t.string   "full_name"
    t.string   "nick",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["nick"], name: "index_users_on_nick", unique: true, using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree

  create_table "workout_movements", force: :cascade do |t|
    t.integer  "workout_id",                           null: false
    t.integer  "original_movement_id"
    t.string   "custom_title"
    t.integer  "custom_reps",            default: 0,   null: false
    t.decimal  "custom_weight_kilos",    default: 0.0, null: false
    t.decimal  "custom_distance_meters", default: 0.0, null: false
    t.decimal  "custom_height_meters",   default: 0.0, null: false
    t.integer  "custom_time_seconds",    default: 0,   null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "title",                           null: false
    t.text     "description"
    t.text     "pre_workout"
    t.text     "special_pre_workout"
    t.text     "post_workout"
    t.integer  "rounds",              default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "athlete_wod_log_movements", "athlete_wod_logs"
  add_foreign_key "athlete_wod_log_movements", "workout_movements"
  add_foreign_key "athlete_wods", "users", column: "athlete_id"
  add_foreign_key "athlete_wods", "users", column: "trainer_id"
  add_foreign_key "athlete_wods", "workouts"
  add_foreign_key "movements", "users", column: "owner_id"
  add_foreign_key "teams", "users", column: "owner_id"
  add_foreign_key "workout_movements", "movements", column: "original_movement_id"
  add_foreign_key "workout_movements", "workouts"
  add_foreign_key "workouts", "users", column: "owner_id"
end
