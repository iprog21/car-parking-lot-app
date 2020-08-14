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

ActiveRecord::Schema.define(version: 2020_08_14_052411) do

  create_table "parking_logs", force: :cascade do |t|
    t.integer "parking_lot_id"
    t.string "plate_number"
    t.string "color"
    t.datetime "entry"
    t.datetime "departure"
    t.decimal "hourly_rate", precision: 8, scale: 2, default: "0.0"
    t.integer "grace_period"
    t.decimal "amount_paid"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_lot_id"], name: "index_parking_logs_on_parking_lot_id"
  end

  create_table "parking_lots", force: :cascade do |t|
    t.string "plate_number"
    t.string "color"
    t.boolean "available", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "hourly_rate", precision: 8, scale: 2, default: "0.0"
    t.integer "grace_period", default: 0
    t.datetime "time_parked"
  end

end
