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

ActiveRecord::Schema.define(version: 17) do

  create_table "attachments", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "company_id"
    t.string   "attach_id"
    t.string   "attach_filename"
    t.integer  "attach_size"
    t.string   "attach_content_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "attachments", ["company_id"], name: "index_attachments_on_company_id"
  add_index "attachments", ["product_id"], name: "index_attachments_on_product_id"

  create_table "categories", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "displayed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id"

  create_table "category_translations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id"
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale"

  create_table "companies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "company_translations", force: :cascade do |t|
    t.integer  "company_id",  null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
  end

  add_index "company_translations", ["company_id"], name: "index_company_translations_on_company_id"
  add_index "company_translations", ["locale"], name: "index_company_translations_on_locale"

  create_table "dashboards", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dashboards", ["user_id"], name: "index_dashboards_on_user_id", unique: true

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id"

  create_table "product_translations", force: :cascade do |t|
    t.integer  "product_id",        null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.string   "sku"
    t.text     "description"
    t.text     "short_description"
  end

  add_index "product_translations", ["locale"], name: "index_product_translations_on_locale"
  add_index "product_translations", ["product_id"], name: "index_product_translations_on_product_id"

  create_table "products", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "sku"
    t.text     "description"
    t.text     "short_description"
    t.boolean  "active"
    t.decimal  "weight",            precision: 12, scale: 3
    t.decimal  "price",             precision: 12, scale: 3
    t.decimal  "cost_price",        precision: 12, scale: 3
    t.boolean  "featured"
    t.boolean  "stock_control"
    t.integer  "category_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "properties", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "properties", ["product_id"], name: "index_properties_on_product_id"

  create_table "property_translations", force: :cascade do |t|
    t.integer  "property_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "key"
    t.string   "value"
  end

  add_index "property_translations", ["locale"], name: "index_property_translations_on_locale"
  add_index "property_translations", ["property_id"], name: "index_property_translations_on_property_id"

  create_table "uploads", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "company_id"
    t.string   "avatar_id"
    t.string   "attach_filename"
    t.integer  "attach_size"
    t.string   "attach_content_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "uploads", ["company_id"], name: "index_uploads_on_company_id"
  add_index "uploads", ["product_id"], name: "index_uploads_on_product_id"

  create_table "user_translations", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "user_translations", ["locale"], name: "index_user_translations_on_locale"
  add_index "user_translations", ["user_id"], name: "index_user_translations_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "name",                                null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
