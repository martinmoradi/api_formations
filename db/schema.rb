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

ActiveRecord::Schema.define(version: 2021_03_08_145812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "room_location", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_category_assignments", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_course_category_assignments_on_category_id"
    t.index ["course_id"], name: "index_course_category_assignments_on_course_id"
  end

  create_table "course_sessions", force: :cascade do |t|
    t.date "date", null: false
    t.integer "remaining_seats", default: 20, null: false
    t.bigint "classroom_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_course_sessions_on_classroom_id"
    t.index ["course_id"], name: "index_course_sessions_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "session_attendees", force: :cascade do |t|
    t.float "assessment"
    t.bigint "student_id", null: false
    t.bigint "course_session_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_session_id"], name: "index_session_attendees_on_course_session_id"
    t.index ["student_id"], name: "index_session_attendees_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "jti", null: false
    t.boolean "is_validated", default: false, null: false
    t.string "role", default: "student", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "course_category_assignments", "categories"
  add_foreign_key "course_category_assignments", "courses"
  add_foreign_key "course_sessions", "classrooms"
  add_foreign_key "course_sessions", "courses"
  add_foreign_key "courses", "users", column: "teacher_id"
  add_foreign_key "session_attendees", "course_sessions"
  add_foreign_key "session_attendees", "users", column: "student_id"
end
