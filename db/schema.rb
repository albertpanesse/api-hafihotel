# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_22_035746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "configs", force: :cascade do |t|
    t.string "cfg_name", null: false
    t.string "cfg_type", null: false
    t.string "cfg_value"
    t.boolean "is_del", default: false, null: false
    t.boolean "is_sync", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.string "phone"
    t.boolean "is_del", default: false, null: false
    t.boolean "is_sync", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.boolean "is_del", default: false, null: false
    t.boolean "is_sync", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "order_date"
    t.boolean "is_del", default: false, null: false
    t.boolean "is_sync", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "roomNum", null: false
    t.string "status", default: "F", null: false
    t.integer "customer_ref"
    t.datetime "checkin"
    t.datetime "checkout"
    t.boolean "is_del", default: false, null: false
    t.boolean "is_sync", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "room_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "desc"
    t.boolean "is_del", default: false, null: false
    t.boolean "is_sync", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.string "dim"
    t.string "desc"
    t.integer "cap", default: 0, null: false
    t.string "image"
    t.boolean "is_del", default: false, null: false
    t.boolean "is_sync", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "room_category_id"
    t.index ["room_category_id"], name: "index_rooms_on_room_category_id"
  end

  add_foreign_key "order_details", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "rooms", "room_categories"
end
