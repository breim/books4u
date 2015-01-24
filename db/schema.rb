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

ActiveRecord::Schema.define(version: 20150124201331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.float    "nota_pi"
    t.float    "nota_pf"
    t.boolean  "done"
    t.integer  "professor_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "courses", ["professor_id"], name: "index_courses_on_professor_id", using: :btree

  create_table "professors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "price"
    t.decimal  "nota_pi"
    t.decimal  "nota_pf"
    t.decimal  "cr"
    t.integer  "ranking"
    t.text     "horario"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.string   "major"
    t.integer  "semester"
  end

  add_index "professors", ["user_id"], name: "index_professors_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "facebook_image"
    t.string   "gender"
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
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "courses", "professors"
  add_foreign_key "professors", "users"
end
