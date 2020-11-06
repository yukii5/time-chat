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

ActiveRecord::Schema.define(version: 2020_10_25_051033) do

  create_table "attendances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "start_time"
    t.datetime "last_time"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "daytimes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "attendance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendance_id"], name: "index_daytimes_on_attendance_id"
    t.index ["user_id"], name: "index_daytimes_on_user_id"
  end

  create_table "homes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "@search_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["@search_id"], name: "index_homes_on_@search_id"
  end

  create_table "searches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "family_name", null: false
    t.string "first_name"
    t.string "family_name_kana"
    t.string "first_name_kana"
    t.integer "sex_id"
    t.date "age"
    t.string "company"
    t.string "position"
    t.string "postal_code", null: false
    t.string "address1", null: false
    t.string "address2", null: false
    t.string "address3", null: false
    t.string "building_name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sns_credentials", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "daytimes", "attendances"
  add_foreign_key "daytimes", "users"
  add_foreign_key "sns_credentials", "users"
end
