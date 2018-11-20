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

ActiveRecord::Schema.define(version: 2018_11_20_013738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dog_walkings", force: :cascade do |t|
    t.integer "status", default: 0
    t.date "scheduled_on"
    t.decimal "price_value", precision: 8, scale: 2, default: "0.0", null: false
    t.integer "scheduled_duration", default: 0
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pet_owners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name", null: false
    t.string "breed"
    t.date "born_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pet_owner_id"
    t.index ["pet_owner_id"], name: "index_pets_on_pet_owner_id"
  end

  add_foreign_key "pets", "pet_owners"
end
