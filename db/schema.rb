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

ActiveRecord::Schema.define(version: 2020_03_11_054015) do

  create_table "cards", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "image"
    t.boolean "pitcher", default: false, null: false
    t.boolean "catcher", default: false, null: false
    t.boolean "first", default: false, null: false
    t.boolean "second", default: false, null: false
    t.boolean "third", default: false, null: false
    t.boolean "short", default: false, null: false
    t.boolean "left", default: false, null: false
    t.boolean "center", default: false, null: false
    t.boolean "right", default: false, null: false
    t.boolean "dh", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "pitcher_card_id"
    t.integer "catcher_card_id"
    t.integer "first_card_id"
    t.integer "second_card_id"
    t.integer "third_card_id"
    t.integer "short_card_id"
    t.integer "left_card_id"
    t.integer "center_card_id"
    t.integer "right_card_id"
    t.integer "dh_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
