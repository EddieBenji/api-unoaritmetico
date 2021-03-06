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

ActiveRecord::Schema.define(version: 20160319221139) do

  create_table "games", force: :cascade do |t|
    t.date     "date_game"
    t.string   "device_id",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "operations", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "plays", force: :cascade do |t|
    t.integer  "game_id",      limit: 4
    t.integer  "turn",         limit: 4
    t.string   "player",       limit: 255
    t.boolean  "color",        limit: 1
    t.integer  "op_deck_id",   limit: 4
    t.integer  "op_player_id", limit: 4
    t.integer  "value",        limit: 4
    t.integer  "time_taken",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "plays", ["game_id"], name: "index_plays_on_game_id", using: :btree
  add_index "plays", ["op_deck_id"], name: "index_plays_on_op_deck_id", using: :btree
  add_index "plays", ["op_player_id"], name: "index_plays_on_op_player_id", using: :btree

  add_foreign_key "plays", "games"
  add_foreign_key "plays", "operations", column: "op_deck_id"
  add_foreign_key "plays", "operations", column: "op_player_id"
end
