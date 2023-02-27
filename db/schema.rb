ActiveRecord::Schema[7.0].define(version: 2023_02_27_132312) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "cat_id", null: false
    t.bigint "user_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_bookings_on_cat_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.string "pickup_address"
    t.integer "angriness_level"
    t.integer "fluffiness"
    t.string "color"
    t.bigint "user_id", null: false
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "cats"
  add_foreign_key "bookings", "users"
  add_foreign_key "cats", "users"
end