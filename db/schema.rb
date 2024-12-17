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

ActiveRecord::Schema[7.0].define(version: 2024_12_17_170756) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "battle_histories", force: :cascade do |t|
    t.integer "hero1_id", null: false
    t.integer "hero2_id", null: false
    t.integer "winner_id", null: false
    t.datetime "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero1_id"], name: "index_battle_histories_on_hero1_id"
    t.index ["hero2_id"], name: "index_battle_histories_on_hero2_id"
    t.index ["winner_id"], name: "index_battle_histories_on_winner_id"
  end

  create_table "heroes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "health", default: 100, null: false
    t.integer "attack_power", default: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "crit", default: 25, null: false
    t.integer "accuraty", default: 80, null: false
    t.integer "xp", default: 0, null: false
    t.integer "battles", default: 0, null: false
    t.integer "wins", default: 0, null: false
  end

  create_table "heroes_weapons", force: :cascade do |t|
    t.integer "hero_id", null: false
    t.integer "weapon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_heroes_weapons_on_hero_id"
    t.index ["weapon_id"], name: "index_heroes_weapons_on_weapon_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "health", default: 0, null: false
    t.integer "attack_power", default: 0, null: false
    t.integer "crit", default: 0, null: false
    t.integer "accuraty", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "battle_histories", "heroes", column: "hero1_id"
  add_foreign_key "battle_histories", "heroes", column: "hero2_id"
  add_foreign_key "battle_histories", "heroes", column: "winner_id"
  add_foreign_key "heroes_weapons", "heroes"
  add_foreign_key "heroes_weapons", "weapons"
end
