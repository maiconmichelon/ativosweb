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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140119002818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "component_fixtures", id: false, force: true do |t|
    t.integer "component_id"
    t.integer "fixture_id"
    t.integer "quantity"
    t.string  "description"
  end

  add_index "component_fixtures", ["component_id", "fixture_id"], name: "index_component_fixtures_on_component_id_and_fixture_id", unique: true, using: :btree

  create_table "components", force: true do |t|
    t.string   "name",       default: "",   null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "components", ["name"], name: "index_components_on_name", unique: true, using: :btree

  create_table "components_types", force: true do |t|
    t.integer "component_id"
    t.integer "type_id"
  end

  add_index "components_types", ["component_id", "type_id"], name: "index_components_types_on_component_id_and_type_id", using: :btree

  create_table "fixtures", force: true do |t|
    t.integer  "number",                                 default: 1,    null: false
    t.string   "warranty"
    t.integer  "provider_id"
    t.date     "acquisition"
    t.integer  "type_id",                                               null: false
    t.integer  "person_id"
    t.decimal  "purchaseValue", precision: 10, scale: 2
    t.boolean  "active",                                 default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fixtures", ["number", "type_id"], name: "index_fixtures_on_number_and_type_id", unique: true, using: :btree

  create_table "groups", force: true do |t|
    t.string   "name",       default: "",   null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "people", force: true do |t|
    t.string   "name",       default: "",   null: false
    t.integer  "group_id"
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["name"], name: "index_people_on_name", unique: true, using: :btree

  create_table "providers", force: true do |t|
    t.string   "name",         default: "",   null: false
    t.string   "cpfCnpj"
    t.string   "phone"
    t.string   "localization"
    t.boolean  "active",       default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["cpfCnpj"], name: "index_providers_on_cpfCnpj", unique: true, using: :btree

  create_table "types", force: true do |t|
    t.string   "description",  default: "",   null: false
    t.boolean  "active",       default: true, null: false
    t.integer  "initial_code", default: 1,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "types", ["description"], name: "index_types_on_description", unique: true, using: :btree

end
