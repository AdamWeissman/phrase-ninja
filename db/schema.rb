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

ActiveRecord::Schema.define(version: 2020_03_17_105813) do

  create_table "phrases", force: :cascade do |t|
    t.text "english"
    t.text "english_equivalent"
    t.text "japanese"
    t.text "japanese_phonetic"
    t.float "familiarity_score"
    t.string "category"
    t.boolean "studying_now", default: false
    t.integer "situation_id", null: false
    t.integer "score_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["score_id"], name: "index_phrases_on_score_id"
    t.index ["situation_id"], name: "index_phrases_on_situation_id"
    t.index ["user_id"], name: "index_phrases_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.string "familiarity_name"
    t.float "familiarity_name_corresponding_points"
    t.boolean "studying_now", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "situations", force: :cascade do |t|
    t.string "name"
    t.float "score_average"
    t.float "score_median"
    t.float "score_mode"
    t.text "text_blob_for_phrases"
    t.boolean "studying_now", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_situations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "beta_key"
    t.text "study_material"
    t.string "google_token"
    t.string "google_refresh_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "phrases", "scores"
  add_foreign_key "phrases", "situations"
  add_foreign_key "phrases", "users"
  add_foreign_key "scores", "users"
  add_foreign_key "situations", "users"
end
