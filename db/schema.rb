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

ActiveRecord::Schema.define(version: 2021_02_06_024153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocked_ips", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "blocked_user_id"
    t.string "ip_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blocked_user_id"], name: "index_blocked_ips_on_blocked_user_id"
    t.index ["user_id"], name: "index_blocked_ips_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "guest_user_id"
    t.bigint "qr_code_id"
    t.bigint "qr_user_id"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guest_user_id"], name: "index_conversations_on_guest_user_id"
    t.index ["qr_code_id"], name: "index_conversations_on_qr_code_id"
    t.index ["qr_user_id"], name: "index_conversations_on_qr_user_id"
  end

  create_table "credential_histories", force: :cascade do |t|
    t.string "ip"
    t.string "user_agent"
    t.bigint "credential_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credential_id"], name: "index_credential_histories_on_credential_id"
    t.index ["user_id"], name: "index_credential_histories_on_user_id"
  end

  create_table "credentials", force: :cascade do |t|
    t.bigint "user_id"
    t.string "cookie_token"
    t.string "email"
    t.string "otp_token"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_credentials_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.datetime "read_at"
    t.bigint "author_id"
    t.bigint "conversation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_messages_on_author_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "qr_codes", force: :cascade do |t|
    t.string "code"
    t.text "private_description"
    t.text "private_name"
    t.text "public_description"
    t.text "public_name"
    t.integer "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_qr_codes_on_user_id"
  end

  create_table "qr_views", force: :cascade do |t|
    t.string "ip_address"
    t.text "user_agent"
    t.bigint "qr_code_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["qr_code_id"], name: "index_qr_views_on_qr_code_id"
    t.index ["user_id"], name: "index_qr_views_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
