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

ActiveRecord::Schema.define(version: 20150225202104) do

  create_table "cooking_recipes", force: :cascade do |t|
    t.string   "name",          limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "servings"
    t.integer  "duration_mins"
    t.integer  "user_id"
    t.string   "locale"
  end

  create_table "directions", force: :cascade do |t|
    t.string   "description",       limit: 255
    t.integer  "cooking_recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
  end

  create_table "images", force: :cascade do |t|
    t.string   "file",           limit: 255
    t.string   "imageable_type", limit: 255
    t.integer  "imageable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",              limit: 255,             null: false
    t.string   "description",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "necessities_count",             default: 0
    t.string   "locale"
  end

  create_table "necessities", force: :cascade do |t|
    t.float    "amount"
    t.integer  "unit_id"
    t.integer  "ingredient_id"
    t.integer  "cooking_recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: :cascade do |t|
    t.string   "name",              limit: 255,             null: false
    t.integer  "necessities_count",             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
  end

end
