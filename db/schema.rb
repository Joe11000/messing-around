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

ActiveRecord::Schema.define(version: 2018_08_29_014339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false

    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"

    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "dogs", force: :cascade do |t|
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "name"
    t.bigint "owner_id"
    t.datetime "updated_at", null: false

    t.index ["deleted_at"], name: "index_dogs_on_deleted_at"
    t.index ["name"], name: "index_dogs_on_name"
    t.index ["owner_id"], name: "index_dogs_on_owner_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toys", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "cost", precision: 10, scale: 2
    t.bigint "dog_id"
    t.integer "fun_level", default: 0
    t.string "type"
    t.datetime "updated_at", null: false

    t.index ["dog_id"], name: "index_toys_on_dog_id"
  end

  create_table "users", force: :cascade do |t|
    t.date "birthday", null: false
    t.decimal "cash", precision: 10, scale: 2, default: "0.0"
    t.integer "counter_cache"
    t.datetime "created_at", default: "2018-08-28 21:44:32", null: false
    t.datetime "deleted_at"
    t.integer "dogs_count"
    t.string "email"
    t.integer "lock_version"
    t.string "name"
    t.string "password_digest"
    t.integer "sexuality", default: 0
    t.integer "security_clearance", default: 0
    t.datetime "updated_at", default: "2018-08-28 21:44:32", null: false

    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end

  add_foreign_key "toys", "dogs"
end
