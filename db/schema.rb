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

ActiveRecord::Schema[7.0].define(version: 2023_09_05_100609) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admissions", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "other_names"
    t.date "date_of_birth"
    t.string "country"
    t.string "state"
    t.string "lga"
    t.string "phone"
    t.string "email"
    t.string "transcript"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessments", force: :cascade do |t|
    t.string "type"
    t.string "subject"
    t.string "class"
    t.string "term"
    t.string "academic_session"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "other_names"
    t.string "phone"
    t.string "email"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "correspondences", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "other_names"
    t.string "photo"
    t.string "teachers_remark"
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

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "d_date"
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

  create_table "expenditures", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fees", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homeworks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "cash_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manage_schools", force: :cascade do |t|
    t.string "namet"
    t.string "moto"
    t.string "logo"
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

  create_table "recruitments", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "other_names"
    t.date "date_of_birth"
    t.string "country"
    t.string "state"
    t.string "lga"
    t.string "qualification"
    t.string "prof_certs"
    t.string "cover_letter"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "other_names"
    t.string "photo"
    t.string "type"
    t.string "class"
    t.string "term"
    t.string "academic_session"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "other_names"
    t.string "photo"
    t.string "type"
    t.string "class"
    t.string "subject"
    t.string "ca"
    t.string "project"
    t.string "homework"
    t.string "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "revenues", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.string "level"
    t.string "amount"
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
    t.decimal "salary"
    t.date "hire_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "department_id", null: false
    t.string "designation"
    t.boolean "teacher"
    t.boolean "administrator"
    t.boolean "human_resource"
    t.boolean "frontdesk"
    t.boolean "chef"
    t.boolean "accountant"
    t.boolean "librarian"
    t.boolean "principal"
    t.boolean "vice_principal"
    t.boolean "bursar"
    t.boolean "guidance_counselor"
    t.boolean "nurse"
    t.boolean "security"
    t.boolean "cleaner"
    t.boolean "driver"
    t.boolean "other"
    t.index ["department_id"], name: "index_staffs_on_department_id"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
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

  create_table "textbooks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "level"
    t.string "publisher"
    t.string "year_of_publication"
    t.string "authur"
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
    t.string "firstname"
    t.string "lastname"
    t.string "photo"
    t.string "phone"
    t.string "country"
    t.string "state"
    t.string "lga"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "other_names"
    t.string "phone"
    t.string "email"
    t.string "enquiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "staffs", "departments"
end
