# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120701200203) do

  create_table "encounters", :force => true do |t|
    t.string   "text"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "encounters", ["location_id"], :name => "index_encounters_on_location_id"

  create_table "expansions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "neighborhood_id"
    t.integer  "expansion_id"
  end

  add_index "locations", ["expansion_id"], :name => "index_locations_on_expansion_id"
  add_index "locations", ["neighborhood_id"], :name => "index_locations_on_neighborhood_id"

  create_table "neighborhoods", :force => true do |t|
    t.string   "name"
    t.integer  "expansion_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "neighborhoods", ["expansion_id"], :name => "index_neighborhoods_on_expansion_id"

end
