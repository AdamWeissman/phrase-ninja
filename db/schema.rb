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

ActiveRecord::Schema.define(version: 2020_03_17_111636) do

  create_table "emotions", force: :cascade do |t|
    t.string "name"
    t.boolean "studying_now", default: false
    t.integer "situation_id", null: false
    t.integer "phrase_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phrase_id"], name: "index_emotions_on_phrase_id"
    t.index ["situation_id"], name: "index_emotions_on_situation_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.boolean "studying_now", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_languages_on_user_id"
  end

  create_table "phrase_scores", force: :cascade do |t|
    t.float "english_familiarity_rank"
    t.float "foreign_familiarity_rank"
    t.boolean "studying_now", default: false
    t.integer "phrase_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phrase_id"], name: "index_phrase_scores_on_phrase_id"
  end

  create_table "phrases", force: :cascade do |t|
    t.text "english"
    t.text "foreign"
    t.string "category"
    t.boolean "studying_now", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "situations", force: :cascade do |t|
    t.string "name"
    t.boolean "studying_now", default: false
    t.integer "user_id", null: false
    t.integer "language_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_situations_on_language_id"
    t.index ["user_id"], name: "index_situations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "beta_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "emotions", "phrases"
  add_foreign_key "emotions", "situations"
  add_foreign_key "languages", "users"
  add_foreign_key "phrase_scores", "phrases"
  add_foreign_key "situations", "languages"
  add_foreign_key "situations", "users"
end
