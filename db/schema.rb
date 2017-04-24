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

ActiveRecord::Schema.define(version: 20170424032021) do

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

  create_table "activities", force: :cascade do |t|
    t.string   "activity_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "description"
  end

  create_table "add_image_url_to_trips", force: :cascade do |t|
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "author"
    t.date     "publish_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
  end

  create_table "certificates", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "certificates_drivers", id: false, force: :cascade do |t|
    t.integer "certificate_id"
    t.integer "driver_id"
  end

  add_index "certificates_drivers", ["certificate_id"], name: "index_certificates_drivers_on_certificate_id", using: :btree
  add_index "certificates_drivers", ["driver_id"], name: "index_certificates_drivers_on_driver_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "normal_user_id"
    t.integer  "commentable_id"
    t.string   "message"
    t.integer  "rating"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "commentable_type"
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
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "driving_years"
    t.boolean  "childsafe"
    t.boolean  "is_active",              default: true
    t.integer  "user_id"
    t.string   "slug"
    t.decimal  "rating"
    t.boolean  "english_communication"
    t.string   "driving_experience"
    t.boolean  "basic_history"
    t.boolean  "smartphone_photography"
    t.boolean  "basic_dslr"
    t.string   "youtube_url"
    t.string   "card_img"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "guides", force: :cascade do |t|
    t.string   "city"
    t.string   "contact"
    t.integer  "daily_price_cents",    default: 0,     null: false
    t.string   "daily_price_currency", default: "USD", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "imagable_type"
    t.integer  "imagable_id"
    t.string   "url"
    t.string   "alt_text"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "url_small"
    t.boolean  "is_hero",       default: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "purchasable_id"
    t.string   "purchasable_type"
    t.decimal  "price"
    t.integer  "buyer_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "status"
    t.string   "email"
    t.date     "start_date"
    t.string   "country"
    t.string   "contact"
    t.integer  "driver_id"
    t.integer  "vehicle_id"
    t.text     "comments"
    t.string   "email_confirmation"
    t.string   "country_code"
    t.string   "phone_number"
    t.string   "pickup"
    t.string   "reference_id"
    t.integer  "address_id"
    t.integer  "tour_id"
    t.string   "pickup_time"
    t.integer  "traveller_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "passport_number"
    t.string   "nationality"
    t.string   "vehicle_type"
    t.string   "latlng"
  end

  create_table "seos", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.string   "author"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "page"
  end

  create_table "tour_activities", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tour_activities", ["activity_id"], name: "index_tour_activities_on_activity_id", using: :btree
  add_index "tour_activities", ["tour_id"], name: "index_tour_activities_on_tour_id", using: :btree

  create_table "tour_drivers", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tour_drivers", ["driver_id"], name: "index_tour_drivers_on_driver_id", using: :btree
  add_index "tour_drivers", ["tour_id"], name: "index_tour_drivers_on_tour_id", using: :btree

  create_table "tour_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "tuktuk_price_cents",    default: 0,     null: false
    t.string   "tuktuk_price_currency", default: "USD", null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "image_url"
    t.string   "description"
    t.string   "slug"
    t.text     "important_info"
    t.decimal  "rating"
    t.integer  "car_price_cents",       default: 0,     null: false
    t.string   "car_price_currency",    default: "USD", null: false
    t.integer  "distance"
    t.integer  "checkpoint_num"
    t.string   "duration"
    t.decimal  "down_payment"
    t.string   "down_payment_currency"
    t.decimal  "booking_fee"
    t.string   "booking_fee_currency"
    t.string   "highlight_html"
    t.string   "include_html"
    t.string   "exclude_html"
    t.string   "tour_start"
    t.string   "tour_end"
    t.string   "card_img"
    t.boolean  "is_active",             default: false
    t.string   "video_url"
    t.integer  "ticket_price_cents",    default: 0,     null: false
    t.string   "ticket_price_currency", default: "USD", null: false
    t.integer  "tour_type_id"
    t.string   "feature_tour",          default: "no"
    t.text     "schedule"
    t.string   "tour_location"
  end

  add_index "tours", ["tour_type_id"], name: "index_tours_on_tour_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "type"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.boolean  "internal_user",          default: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "brand"
    t.integer  "seat_number"
    t.integer  "year"
  end

  add_foreign_key "tour_activities", "activities"
  add_foreign_key "tour_activities", "tours"
  add_foreign_key "tour_drivers", "drivers"
  add_foreign_key "tour_drivers", "tours"
  add_foreign_key "tours", "tour_types"
end
