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

ActiveRecord::Schema.define(version: 20160624135011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer  "railway_station_id"
    t.integer  "route_id"
    t.integer  "number"
    t.integer  "position"
    t.datetime "arrive",             default: '2016-06-26 15:28:56'
    t.datetime "departure",          default: '2016-06-26 15:28:57'
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "initial_station"
    t.string   "final_station"
    t.string   "name"
    t.string   "surname"
    t.string   "passport_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "train_id"
    t.integer  "initial_station_id"
    t.integer  "final_station_id"
  end

  add_index "tickets", ["final_station_id"], name: "index_tickets_on_final_station_id", using: :btree
  add_index "tickets", ["initial_station_id"], name: "index_tickets_on_initial_station_id", using: :btree
  add_index "tickets", ["train_id"], name: "index_tickets_on_train_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "route_id"
    t.integer  "current_station_id"
    t.boolean  "head",               default: true
  end

  add_index "trains", ["current_station_id"], name: "index_trains_on_current_station_id", using: :btree
  add_index "trains", ["route_id"], name: "index_trains_on_route_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "surname"
    t.string   "passport_id"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wagons", force: :cascade do |t|
    t.string   "type"
    t.integer  "number"
    t.integer  "top_seats"
    t.integer  "bottom_seats"
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.integer  "economy_bottom_seats"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "train_id"
  end

  add_index "wagons", ["id", "type"], name: "index_wagons_on_id_and_type", using: :btree
  add_index "wagons", ["train_id"], name: "index_wagons_on_train_id", using: :btree

end
