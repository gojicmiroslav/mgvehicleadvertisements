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

ActiveRecord::Schema.define(version: 20160815142538) do

  create_table "advertisement_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "advertisements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description",           limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "fuel_id"
    t.integer  "style_id"
    t.integer  "air_condition_id"
    t.integer  "exterior_color_id"
    t.integer  "interior_color_id"
    t.integer  "engine_id"
    t.integer  "drive_id"
    t.integer  "transmission_id"
    t.integer  "category_id"
    t.integer  "vehicle_model_id"
    t.integer  "user_id"
    t.integer  "advertisement_type_id"
    t.index ["advertisement_type_id"], name: "index_advertisements_on_advertisement_type_id", using: :btree
    t.index ["air_condition_id"], name: "index_advertisements_on_air_condition_id", using: :btree
    t.index ["category_id"], name: "index_advertisements_on_category_id", using: :btree
    t.index ["drive_id"], name: "index_advertisements_on_drive_id", using: :btree
    t.index ["engine_id"], name: "index_advertisements_on_engine_id", using: :btree
    t.index ["exterior_color_id"], name: "index_advertisements_on_exterior_color_id", using: :btree
    t.index ["fuel_id"], name: "index_advertisements_on_fuel_id", using: :btree
    t.index ["interior_color_id"], name: "index_advertisements_on_interior_color_id", using: :btree
    t.index ["style_id"], name: "index_advertisements_on_style_id", using: :btree
    t.index ["transmission_id"], name: "index_advertisements_on_transmission_id", using: :btree
    t.index ["user_id"], name: "index_advertisements_on_user_id", using: :btree
    t.index ["vehicle_model_id"], name: "index_advertisements_on_vehicle_model_id", using: :btree
  end

  create_table "advertisements_options", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "advertisement_id", null: false
    t.integer "option_id",        null: false
    t.index ["advertisement_id"], name: "index_advertisements_options_on_advertisement_id", using: :btree
    t.index ["option_id"], name: "index_advertisements_options_on_option_id", using: :btree
  end

  create_table "air_conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "categories_vehicle_brands", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id",      null: false
    t.integer "vehicle_brand_id", null: false
    t.index ["category_id"], name: "index_categories_vehicle_brands_on_category_id", using: :btree
    t.index ["vehicle_brand_id"], name: "index_categories_vehicle_brands_on_vehicle_brand_id", using: :btree
  end

  create_table "colors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drives", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fuels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transmissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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

  add_foreign_key "advertisements", "advertisement_types", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "air_conditions", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "categories", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "colors", column: "exterior_color_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "colors", column: "interior_color_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "drives", column: "drive_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "engines", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "fuels", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "styles", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "transmissions", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements", "vehicle_models", on_update: :cascade, on_delete: :cascade
  add_foreign_key "advertisements_options", "advertisements"
  add_foreign_key "advertisements_options", "options"
  add_foreign_key "categories_vehicle_brands", "categories"
  add_foreign_key "categories_vehicle_brands", "vehicle_brands"
  add_foreign_key "vehicle_models", "categories"
  add_foreign_key "vehicle_models", "vehicle_brands"
end
