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

ActiveRecord::Schema.define(:version => 20120908022639) do

  create_table "agencies", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state",      :limit => 2
    t.integer  "zipcode",    :limit => 5
    t.string   "phone",      :limit => 10
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "consultants", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "street"
    t.string   "city"
    t.string   "state",           :limit => 2
    t.integer  "zipcode",         :limit => 5
    t.string   "image"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "password"
    t.string   "password_digest"
    t.string   "email"
    t.string   "remember_token"
  end

  add_index "consultants", ["email"], :name => "index_consultants_on_email", :unique => true
  add_index "consultants", ["remember_token"], :name => "index_consultants_on_remember_token"

  create_table "contracts", :force => true do |t|
    t.integer  "agency_id"
    t.integer  "client_id"
    t.integer  "consultant_id"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "rate",          :precision => 8, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "contract_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "work_activities", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "total_hours", :precision => 8, :scale => 2
    t.integer  "project_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

end
