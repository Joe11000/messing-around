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

ActiveRecord::Schema.define(version: 2018_06_22_202855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dogs", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_dogs_on_name"
    t.index ["owner_id"], name: "index_dogs_on_owner_id"
  end

  create_table "jails", force: :cascade do |t|
    t.string "name"
  end

  create_table "prisoner", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "jail_id", null: false
    t.integer "time"
    t.integer "number"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "sku", limit: 10
    t.integer "count"
    t.text "description"
    t.bigint "supplier_id"
    t.float "popularity"
    t.decimal "price", precision: 10, scale: 2
    t.boolean "available"
    t.datetime "availableSince"
    t.binary "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size"
    t.index ["name"], name: "index_products_on_name"
    t.index ["sku"], name: "index_products_on_sku", unique: true
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.integer "sexuality", default: 0
    t.datetime "created_at", default: "2018-06-21 20:05:42", null: false
    t.datetime "updated_at", default: "2018-06-21 20:05:42", null: false
    t.datetime "deleted_at"
    t.string "password_digest"
    t.date "birthday", null: false
    t.integer "age"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end

  add_foreign_key "products", "suppliers"
end
