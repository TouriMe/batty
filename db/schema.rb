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

ActiveRecord::Schema.define(version: 20151011163953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "add_image_url_to_trips", force: :cascade do |t|
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "normal_user_id"
    t.integer  "commentable_id"
    t.string   "message"
    t.integer  "rating"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "commentable_type"
  end

  create_table "dictionaries", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.string   "dictionariable_type"
    t.integer  "dictionariable_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "driver_cities", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "driver_languages", force: :cascade do |t|
    t.integer  "driver_id"
    t.string   "language_code"
    t.integer  "proficiency"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "driver_languages", ["language_code"], name: "index_driver_languages_on_language_code", using: :btree

  create_table "driver_vehicles", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "short_desc"
    t.string   "description"
    t.string   "phone"
    t.string   "email"
    t.string   "source_url"
    t.string   "avatar_url"
    t.string   "background_url"
    t.string   "video_url"
    t.string   "facebook_url"
    t.string   "wechat_id"
    t.string   "whatsapp_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "driving_years"
    t.boolean  "childsafe"
    t.boolean  "is_active",      default: true
    t.integer  "user_id"
  end

  create_table "guides", force: :cascade do |t|
    t.string   "city"
    t.string   "contact"
    t.integer  "daily_price_cents",    default: 0,     null: false
    t.string   "daily_price_currency", default: "USD", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "url"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "purchasable_id"
    t.string   "purchasable_type"
    t.decimal  "price"
    t.integer  "buyer_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.money    "price",          scale: 2
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "background_url"
  end

  create_table "trip_comments", force: :cascade do |t|
    t.string   "tourist_id"
    t.string   "trip_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_url"
    t.string   "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "type"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
