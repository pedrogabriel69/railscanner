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

ActiveRecord::Schema.define(version: 20160609111600) do

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
    t.datetime "arrive",             default: '2016-06-09 17:01:43'
    t.datetime "departure",          default: '2016-06-09 17:01:44'
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "initial_station"
    t.string   "final_station"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "train_id"
    t.integer  "initial_station_id"
    t.integer  "final_station_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "route_id"
    t.integer  "current_station_id"
    t.boolean  "head",               default: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "surname"
    t.string   "passport_id"
  end

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

end
