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

ActiveRecord::Schema.define(version: 20141102212230) do

  create_table "cooking_recipes", force: true do |t|
    t.string   "name",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "images", force: true do |t|
    t.string   "file"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "necessities", force: true do |t|
    t.integer  "amount",            null: false
    t.integer  "unit_id",           null: false
    t.integer  "ingredient_id",     null: false
    t.integer  "cooking_recipe_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proceedings", force: true do |t|
    t.string   "description",       null: false
    t.integer  "cooking_recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string "name", null: false
  end

end
