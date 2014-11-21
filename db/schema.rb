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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131204055300) do

  create_table "lessons", :force => true do |t|
    t.integer  "user_id"
    t.string   "instructor"
    t.date     "date"
    t.string   "body"
    t.boolean  "solved",     :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "lessons", ["user_id"], :name => "index_lessons_on_user_id"

  create_table "responds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.string   "body"
    t.string   "respond_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "responds", ["lesson_id"], :name => "index_responds_on_lesson_id"
  add_index "responds", ["user_id"], :name => "index_responds_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.integer  "platoon",         :default => 0, :null => false
    t.integer  "squad",           :default => 0, :null => false
    t.string   "password_digest"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
