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

ActiveRecord::Schema.define(version: 2019_12_15_133646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "architects", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_architect_associations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "architect_id"
    t.bigint "project_id"
    t.index ["architect_id"], name: "index_project_architect_associations_on_architect_id"
    t.index ["project_id"], name: "index_project_architect_associations_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "long_desc"
    t.text "short_desc"
    t.integer "year"
    t.string "function"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "project_architect_associations", "architects"
  add_foreign_key "project_architect_associations", "projects"
end
