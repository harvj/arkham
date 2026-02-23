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

ActiveRecord::Schema[8.1].define(version: 2026_02_22_215612) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "encounters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.bigint "expansion_id", null: false
    t.bigint "location_id", null: false
    t.datetime "updated_at", null: false
    t.index ["expansion_id"], name: "index_encounters_on_expansion_id"
    t.index ["location_id"], name: "index_encounters_on_location_id"
  end

  create_table "expansions", force: :cascade do |t|
    t.string "box_type"
    t.boolean "can_visit"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "expansion_id", null: false
    t.string "name"
    t.bigint "neighborhood_id", null: false
    t.datetime "updated_at", null: false
    t.index ["expansion_id"], name: "index_locations_on_expansion_id"
    t.index ["neighborhood_id"], name: "index_locations_on_neighborhood_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "expansion_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["expansion_id"], name: "index_neighborhoods_on_expansion_id"
  end

  add_foreign_key "encounters", "expansions"
  add_foreign_key "encounters", "locations"
  add_foreign_key "locations", "expansions"
  add_foreign_key "locations", "neighborhoods"
  add_foreign_key "neighborhoods", "expansions"
end
