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

ActiveRecord::Schema.define(version: 20180524200138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "categories", force: :cascade do |t|
    t.citext "name"
    t.string "image"
    t.float "max_product_score", default: 0.0
    t.integer "products_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name"
    t.string "image"
    t.string "url"
    t.float "score", default: 0.0
    t.decimal "price", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "score"], name: "index_products_on_category_id_and_score", order: { score: :desc }
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  add_foreign_key "products", "categories"
end
