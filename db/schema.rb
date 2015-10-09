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

ActiveRecord::Schema.define(version: 20151009041729) do

  create_table "games", force: :cascade do |t|
    t.date    "date_game"
    t.string  "device_id", limit: 255
    t.integer "play_id",   limit: 4
  end

  add_index "games", ["play_id"], name: "index_games_on_play_id", using: :btree

  create_table "plays", force: :cascade do |t|
    t.string "turn",      limit: 255
    t.string "player",    limit: 255
    t.string "color",     limit: 255
    t.string "op_deck",   limit: 255
    t.string "op_player", limit: 255
    t.string "value",     limit: 255
  end

  add_foreign_key "games", "plays"
end
