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

ActiveRecord::Schema.define(version: 2021_01_06_124721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "freelancers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.text "biography"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "freelancer_id", null: false
    t.boolean "status", default: false
    t.boolean "accepted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["freelancer_id"], name: "index_requests_on_freelancer_id"
  end

  add_foreign_key "requests", "freelancers"
end
