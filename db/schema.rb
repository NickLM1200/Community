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

ActiveRecord::Schema[7.1].define(version: 2024_10_29_215645) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", primary_key: "username", id: { type: :string, limit: 15 }, force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "firstName", limit: 150, null: false
    t.string "password_digest", limit: 80, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "categories", primary_key: "abbv", id: { type: :string, limit: 5 }, force: :cascade do |t|
    t.string "cat_name", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifications", primary_key: "associationID", force: :cascade do |t|
    t.integer "organizationID_id"
    t.string "categoryabbr_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoryabbr_id"], name: "index_classifications_on_categoryabbr_id"
    t.index ["organizationID_id"], name: "index_classifications_on_organizationID_id"
  end

  create_table "dependents", primary_key: "dependentId", force: :cascade do |t|
    t.string "userID_id"
    t.string "nickname", limit: 50, null: false
    t.string "ageRange", limit: 8, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["userID_id"], name: "index_dependents_on_userID_id"
  end

  create_table "events", primary_key: "eventid", force: :cascade do |t|
    t.string "title", limit: 150, null: false
    t.date "eventDate", null: false
    t.time "eventTime", null: false
    t.text "eventDescription", null: false
    t.string "street", limit: 255, null: false
    t.string "city", limit: 100, null: false
    t.string "eventState", limit: 2, default: "CO", null: false
    t.integer "zipcode", null: false
    t.boolean "isVirtual", null: false
    t.string "meetingLink", limit: 2050
    t.boolean "eventstatus", null: false
    t.integer "organization_id"
    t.string "user_id"
    t.string "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_events_on_admin_id"
    t.index ["organization_id"], name: "index_events_on_organization_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "favorites", primary_key: "favoriteID", force: :cascade do |t|
    t.string "userID_id"
    t.integer "organizationID_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organizationID_id"], name: "index_favorites_on_organizationID_id"
    t.index ["userID_id"], name: "index_favorites_on_userID_id"
  end

  create_table "organizations", primary_key: "organizationId", force: :cascade do |t|
    t.string "org_name", limit: 255, null: false
    t.string "street", limit: 255, null: false
    t.string "city", limit: 100, null: false
    t.string "org_state", limit: 2, default: "CO", null: false
    t.integer "zipcode", null: false
    t.string "email", limit: 255, null: false
    t.string "phoneNumber", limit: 15
    t.string "webLink", limit: 2050
    t.text "servicesSummary", null: false
    t.decimal "avgStarValue", precision: 2, scale: 1
    t.string "admin_username", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "question_answer_rels", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", primary_key: "questionID", force: :cascade do |t|
    t.string "question", limit: 150, null: false
    t.string "admin_username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", primary_key: "reviewID", force: :cascade do |t|
    t.integer "organizationID_id"
    t.string "userID_id"
    t.string "title", limit: 150
    t.text "comment"
    t.decimal "starValue", precision: 2, scale: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "adminID_id"
    t.boolean "reviewStatus", null: false
    t.index ["adminID_id"], name: "index_reviews_on_adminID_id"
    t.index ["organizationID_id"], name: "index_reviews_on_organizationID_id"
    t.index ["userID_id"], name: "index_reviews_on_userID_id"
  end

  create_table "surveys", primary_key: "surveyID", force: :cascade do |t|
    t.string "userID_id"
    t.integer "questionID_id"
    t.string "answer", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionID_id"], name: "index_surveys_on_questionID_id"
    t.index ["userID_id"], name: "index_surveys_on_userID_id"
  end

  create_table "users", primary_key: "username", id: { type: :string, limit: 15 }, force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "first_name", limit: 150, null: false
    t.string "age_range", limit: 8, null: false
    t.string "password_digest", limit: 80, null: false
    t.integer "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "classifications", "categories", column: "categoryabbr_id", primary_key: "abbv"
  add_foreign_key "classifications", "organizations", column: "organizationID_id", primary_key: "organizationId"
  add_foreign_key "dependents", "users", column: "userID_id", primary_key: "username", on_update: :cascade
  add_foreign_key "events", "admins", primary_key: "username", on_delete: :nullify
  add_foreign_key "events", "organizations", primary_key: "organizationId"
  add_foreign_key "events", "users", primary_key: "username", on_update: :cascade
  add_foreign_key "favorites", "organizations", column: "organizationID_id", primary_key: "organizationId"
  add_foreign_key "favorites", "users", column: "userID_id", primary_key: "username", on_update: :cascade
  add_foreign_key "reviews", "admins", column: "adminID_id", primary_key: "username", on_delete: :nullify
  add_foreign_key "reviews", "organizations", column: "organizationID_id", primary_key: "organizationId"
  add_foreign_key "reviews", "users", column: "userID_id", primary_key: "username", on_update: :cascade
  add_foreign_key "surveys", "questions", column: "questionID_id", primary_key: "questionID"
  add_foreign_key "surveys", "users", column: "userID_id", primary_key: "username", on_update: :cascade
  
end
