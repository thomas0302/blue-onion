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

ActiveRecord::Schema[8.0].define(version: 2025_03_03_092448) do
  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.decimal "price_per_item"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_type"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "ordered_at"
    t.decimal "tax_rate"
    t.decimal "shipping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id"
    t.string "payment_id"
    t.decimal "payment_amount"
  end
  

  add_foreign_key "order_items", "orders"
  add_foreign_key "payments", "orders"
end
