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

ActiveRecord::Schema.define(version: 20131216145516) do

  create_table "courses", force: true do |t|
    t.string   "acode"
    t.string   "code"
    t.string   "sgid"
    t.string   "name"
    t.integer  "ects"
    t.integer  "year"
    t.string   "period"
    t.string   "institute"
    t.string   "description"
    t.string   "timetable"
    t.string   "lecture_material"
    t.string   "goals"
    t.integer  "participant_count"
    t.string   "specialities"
    t.string   "examination"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programmes", force: true do |t|
    t.integer  "programme_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "staffs", force: true do |t|
    t.integer  "staff_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["student_id"], name: "index_users_on_student_id", unique: true

end
