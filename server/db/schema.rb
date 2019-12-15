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

ActiveRecord::Schema.define(version: 2019_12_14_232016) do

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
    t.bigint "architects_id"
    t.bigint "projects_id"
    t.index ["architects_id"], name: "index_project_architect_associations_on_architects_id"
    t.index ["projects_id"], name: "index_project_architect_associations_on_projects_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "long_desc"
    t.text "short_desc"
    t.integer "year"
    t.string "function"
    t.string "status"
    t.string "preview_img"
    t.text "imgs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "project_architect_associations", "architects", column: "architects_id"
  add_foreign_key "project_architect_associations", "projects", column: "projects_id"
end
