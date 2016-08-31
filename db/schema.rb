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

ActiveRecord::Schema.define(version: 20160830184210) do

  create_table "advertisement_informations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "value"
    t.integer  "advertisement_id"
    t.integer  "information_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["advertisement_id"], name: "index_advertisement_informations_on_advertisement_id", using: :btree
    t.index ["information_id"], name: "index_advertisement_informations_on_information_id", using: :btree
  end

  create_table "advertisement_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "advertisements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                                        default: "", null: false
    t.text     "description",           limit: 65535
    t.decimal  "price",                               precision: 10, scale: 2,              null: false
    t.date     "year",                                                                      null: false
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.integer  "category_id"
    t.integer  "vehicle_model_id"
    t.integer  "user_id"
    t.integer  "advertisement_type_id"
    t.text     "images",                limit: 65535
    t.string   "slug"
    t.integer  "status"
    t.string   "featured_image"
    t.index ["advertisement_type_id"], name: "index_advertisements_on_advertisement_type_id", using: :btree
    t.index ["category_id"], name: "index_advertisements_on_category_id", using: :btree
    t.index ["slug"], name: "index_advertisements_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_advertisements_on_user_id", using: :btree
    t.index ["vehicle_model_id"], name: "index_advertisements_on_vehicle_model_id", using: :btree
  end

  create_table "advertisements_options", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "advertisement_id", null: false
    t.integer "option_id",        null: false
    t.index ["advertisement_id"], name: "index_advertisements_options_on_advertisement_id", using: :btree
    t.index ["option_id"], name: "index_advertisements_options_on_option_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  end

  create_table "categories_information", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id",    null: false
    t.integer "information_id", null: false
    t.index ["category_id"], name: "index_categories_information_on_category_id", using: :btree
    t.index ["information_id"], name: "index_categories_information_on_information_id", using: :btree
  end

  create_table "categories_items", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id", null: false
    t.integer "item_id",     null: false
    t.index ["category_id"], name: "index_categories_items_on_category_id", using: :btree
    t.index ["item_id"], name: "index_categories_items_on_item_id", using: :btree
  end

  create_table "categories_options", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id", null: false
    t.integer "option_id",   null: false
    t.index ["category_id"], name: "index_categories_options_on_category_id", using: :btree
    t.index ["option_id"], name: "index_categories_options_on_option_id", using: :btree
  end

  create_table "categories_vehicle_brands", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id",      null: false
    t.integer "vehicle_brand_id", null: false
    t.index ["category_id"], name: "index_categories_vehicle_brands_on_category_id", using: :btree
    t.index ["vehicle_brand_id"], name: "index_categories_vehicle_brands_on_vehicle_brand_id", using: :btree
  end

  create_table "information", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "information_type_id"
    t.index ["information_type_id"], name: "index_information_on_information_type_id", using: :btree
  end

  create_table "information_items", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "information_id", null: false
    t.integer "item_id",        null: false
    t.index ["information_id"], name: "index_information_items_on_information_id", using: :btree
    t.index ["item_id"], name: "index_information_items_on_item_id", using: :btree
  end

  create_table "information_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "deleted_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicle_brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_models", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "vehicle_brand_id"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_vehicle_models_on_category_id", using: :btree
    t.index ["vehicle_brand_id"], name: "index_vehicle_models_on_vehicle_brand_id", using: :btree
  end

  add_foreign_key "advertisement_informations", "advertisements"
  add_foreign_key "advertisement_informations", "information"
  add_foreign_key "advertisements", "advertisement_types", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "categories", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "vehicle_models", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements_options", "advertisements"
  add_foreign_key "advertisements_options", "options"
  add_foreign_key "categories_information", "categories"
  add_foreign_key "categories_information", "information"
  add_foreign_key "categories_items", "categories"
  add_foreign_key "categories_items", "items"
  add_foreign_key "categories_options", "categories"
  add_foreign_key "categories_options", "options"
  add_foreign_key "categories_vehicle_brands", "categories"
  add_foreign_key "categories_vehicle_brands", "vehicle_brands"
  add_foreign_key "information", "information_types", on_update: :cascade, on_delete: :cascade
  add_foreign_key "information_items", "information"
  add_foreign_key "information_items", "items"
  add_foreign_key "vehicle_models", "categories"
  add_foreign_key "vehicle_models", "vehicle_brands"
end
