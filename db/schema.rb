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

ActiveRecord::Schema[7.0].define(version: 2023_08_31_114349) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string "term"
    t.string "session"
    t.string "class"
    t.string "question"
    t.string "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string "photo"
    t.string "title"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.date "dateofbirth"
    t.string "country"
    t.string "state"
    t.string "lga"
    t.string "street"
    t.string "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "moto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "photo"
    t.string "title"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.date "dateofbirth"
    t.string "country"
    t.string "state"
    t.string "lga"
    t.string "street"
    t.string "department"
    t.string "role"
    t.decimal "salary"
    t.date "hire_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "photo"
    t.string "title"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.date "dateofbirth"
    t.string "country"
    t.string "state"
    t.string "lga"
    t.string "street"
    t.string "class"
    t.string "admission_number"
    t.text "transcript"
    t.string "fathers_fullname"
    t.string "mothers_fullname"
    t.date "admission_date"
    t.boolean "disabilities"
    t.string "disability_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "term"
    t.string "session"
    t.string "class"
    t.string "question"
    t.string "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

end
