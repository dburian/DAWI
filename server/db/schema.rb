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

ActiveRecord::Schema.define(version: 2019_12_16_002536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "architect_positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "architects", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "position_id"
    t.index ["position_id"], name: "index_architects_on_position_id"
  end

  create_table "project_architect_associations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "architect_id"
    t.bigint "project_id"
    t.index ["architect_id"], name: "index_project_architect_associations_on_architect_id"
    t.index ["project_id"], name: "index_project_architect_associations_on_project_id"
  end

  create_table "project_functions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "long_desc"
    t.text "short_desc"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "function_id"
    t.bigint "status_id"
    t.index ["function_id"], name: "index_projects_on_function_id"
    t.index ["status_id"], name: "index_projects_on_status_id"
  end

  add_foreign_key "architects", "architect_positions", column: "position_id"
  add_foreign_key "project_architect_associations", "architects"
  add_foreign_key "project_architect_associations", "projects"
  add_foreign_key "projects", "project_functions", column: "function_id"
  add_foreign_key "projects", "project_statuses", column: "status_id"
end
