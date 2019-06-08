# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_08_142847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "institutions", force: :cascade do |t|
    t.text "name", null: false
    t.text "cnpj", null: false
    t.text "is_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_institutions_on_cnpj", unique: true
    t.index ["name"], name: "index_institutions_on_name", unique: true
  end

  create_table "invoices", force: :cascade do |t|
    t.decimal "total", null: false
    t.date "expire_at", null: false
    t.bigint "matriculation_id", null: false
    t.text "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matriculation_id"], name: "index_invoices_on_matriculation_id"
  end

  create_table "matriculations", force: :cascade do |t|
    t.decimal "total", null: false
    t.integer "invoice", null: false
    t.integer "invoice_expire_at", null: false
    t.text "course_name", null: false
    t.bigint "institution_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_matriculations_on_institution_id"
    t.index ["student_id"], name: "index_matriculations_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.text "name", null: false
    t.text "cpf", null: false
    t.date "dt_birth"
    t.bigint "telephone"
    t.text "gender", null: false
    t.text "payment_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_students_on_cpf", unique: true
    t.index ["name"], name: "index_students_on_name", unique: true
  end

  add_foreign_key "invoices", "matriculations"
  add_foreign_key "matriculations", "institutions"
  add_foreign_key "matriculations", "students"
end
