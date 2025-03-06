# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_03_04_113727) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "drone_id", null: false
    t.bigint "customer_id", null: false
    t.date "starting_date"
    t.date "ending_date"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["drone_id"], name: "index_bookings_on_drone_id"
  end

  create_table "drone_reviews", force: :cascade do |t|
    t.float "rating"
    t.text "comment"
    t.bigint "drone_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_id"], name: "index_drone_reviews_on_drone_id"
  end

  create_table "drones", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.string "name"
    t.text "description"
    t.integer "price_per_day"
    t.float "flight_time"
    t.float "max_altitude"
    t.float "max_wind_resistance"
    t.float "max_resolution"
    t.float "max_flight_distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_drones_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "drones"
  add_foreign_key "bookings", "users", column: "customer_id"
  add_foreign_key "drone_reviews", "drones"
  add_foreign_key "drones", "users", column: "owner_id"
end
