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

ActiveRecord::Schema.define(version: 2020_11_01_161012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gossip_comments", force: :cascade do |t|
    t.string "content"
    t.bigint "gossip_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gossip_id"], name: "index_gossip_comments_on_gossip_id"
    t.index ["user_id"], name: "index_gossip_comments_on_user_id"
  end

  create_table "gossip_likes", force: :cascade do |t|
    t.bigint "gossip_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gossip_id"], name: "index_gossip_likes_on_gossip_id"
    t.index ["user_id"], name: "index_gossip_likes_on_user_id"
  end

  create_table "gossips", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_gossips_on_city_id"
    t.index ["user_id"], name: "index_gossips_on_user_id"
  end

  create_table "pm_receivers", force: :cascade do |t|
    t.bigint "private_message_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["private_message_id"], name: "index_pm_receivers_on_private_message_id"
    t.index ["user_id"], name: "index_pm_receivers_on_user_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_private_messages_on_user_id"
  end

  create_table "tag_gossips", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "gossip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gossip_id"], name: "index_tag_gossips_on_gossip_id"
    t.index ["tag_id"], name: "index_tag_gossips_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "email"
    t.integer "age"
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "gossip_comments", "gossips"
  add_foreign_key "gossip_comments", "users"
  add_foreign_key "gossip_likes", "gossips"
  add_foreign_key "gossip_likes", "users"
  add_foreign_key "gossips", "cities"
  add_foreign_key "gossips", "users"
  add_foreign_key "pm_receivers", "private_messages"
  add_foreign_key "pm_receivers", "users"
  add_foreign_key "private_messages", "users"
  add_foreign_key "tag_gossips", "gossips"
  add_foreign_key "tag_gossips", "tags"
  add_foreign_key "users", "cities"
end
