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

ActiveRecord::Schema.define(version: 20150610023524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: true do |t|
    t.decimal  "value",       precision: 8, scale: 2, null: false
    t.date     "date",                                null: false
    t.integer  "provider_id",                         null: false
    t.integer  "request_id",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "budgets", ["provider_id"], name: "index_budgets_on_provider_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name",       null: false
    t.integer  "owner_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["name", "owner_id"], name: "index_companies_on_name_and_owner_id", unique: true, using: :btree

  create_table "company_users", force: true do |t|
    t.integer  "user_id",                    null: false
    t.integer  "company_id",                 null: false
    t.boolean  "admin",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "component_fixtures", force: true do |t|
    t.integer "component_id",              null: false
    t.integer "fixture_id",                null: false
    t.integer "quantity",     default: 1,  null: false
    t.string  "description",  default: "", null: false
  end

  add_index "component_fixtures", ["component_id", "fixture_id"], name: "index_component_fixtures_on_component_id_and_fixture_id", unique: true, using: :btree

  create_table "component_types", force: true do |t|
    t.integer "component_id"
    t.integer "type_id"
    t.boolean "pre_selected", default: true, null: false
  end

  add_index "component_types", ["component_id", "type_id"], name: "index_component_types_on_component_id_and_type_id", unique: true, using: :btree

  create_table "components", force: true do |t|
    t.string   "name",       default: "",   null: false
    t.boolean  "active",     default: true, null: false
    t.integer  "company_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "components", ["company_id"], name: "index_components_on_company_id", using: :btree
  add_index "components", ["name", "company_id"], name: "index_components_on_name_and_company_id", unique: true, using: :btree

  create_table "fixtures", force: true do |t|
    t.integer  "number",                                  default: 1,    null: false
    t.string   "warranty"
    t.integer  "provider_id"
    t.date     "acquisition"
    t.integer  "type_id",                                                null: false
    t.integer  "person_id"
    t.decimal  "purchase_value", precision: 10, scale: 2
    t.boolean  "active",                                  default: true, null: false
    t.integer  "company_id",                                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fixtures", ["company_id"], name: "index_fixtures_on_company_id", using: :btree
  add_index "fixtures", ["number", "type_id"], name: "index_fixtures_on_number_and_type_id", unique: true, using: :btree
  add_index "fixtures", ["person_id"], name: "index_fixtures_on_person_id", using: :btree
  add_index "fixtures", ["provider_id"], name: "index_fixtures_on_provider_id", using: :btree
  add_index "fixtures", ["type_id"], name: "index_fixtures_on_type_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name",       default: "",   null: false
    t.boolean  "active",     default: true, null: false
    t.integer  "company_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["company_id"], name: "index_groups_on_company_id", using: :btree
  add_index "groups", ["name", "company_id"], name: "index_groups_on_name_and_company_id", unique: true, using: :btree

  create_table "maintenances", force: true do |t|
    t.date     "date",                                               null: false
    t.string   "description",                                        null: false
    t.decimal  "value",       precision: 8, scale: 2, default: 0.0,  null: false
    t.boolean  "activate",                            default: true, null: false
    t.integer  "person_id",                                          null: false
    t.integer  "fixture_id",                                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "maintenances", ["fixture_id"], name: "index_maintenances_on_fixture_id", using: :btree
  add_index "maintenances", ["person_id"], name: "index_maintenances_on_person_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "name",       default: "",   null: false
    t.integer  "group_id"
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["group_id"], name: "index_people_on_group_id", using: :btree
  add_index "people", ["name", "group_id"], name: "index_people_on_name_and_group_id", unique: true, using: :btree

  create_table "providers", force: true do |t|
    t.string   "name",         default: "",   null: false
    t.string   "cpfCnpj"
    t.string   "phone"
    t.string   "localization"
    t.boolean  "active",       default: true, null: false
    t.integer  "company_id",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["company_id"], name: "index_providers_on_company_id", using: :btree
  add_index "providers", ["cpfCnpj", "company_id"], name: "index_providers_on_cpfCnpj_and_company_id", unique: true, using: :btree

  create_table "requests", force: true do |t|
    t.date     "date",                    null: false
    t.string   "title",                   null: false
    t.string   "description"
    t.integer  "responsible_id",          null: false
    t.integer  "fixture_id"
    t.integer  "status",                  null: false
    t.integer  "approval_responsible_id", null: false
    t.string   "type",                    null: false
    t.integer  "company_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["approval_responsible_id"], name: "index_requests_on_approval_responsible_id", using: :btree
  add_index "requests", ["company_id"], name: "index_requests_on_company_id", using: :btree
  add_index "requests", ["fixture_id"], name: "index_requests_on_fixture_id", using: :btree
  add_index "requests", ["responsible_id"], name: "index_requests_on_responsible_id", using: :btree

  create_table "types", force: true do |t|
    t.string   "description",  default: "",   null: false
    t.boolean  "active",       default: true, null: false
    t.integer  "initial_code", default: 1,    null: false
    t.integer  "company_id",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "types", ["company_id"], name: "index_types_on_company_id", using: :btree
  add_index "types", ["description", "company_id"], name: "index_types_on_description_and_company_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "full_name",              default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
