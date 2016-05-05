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

ActiveRecord::Schema.define(version: 20160505012205) do

  create_table "authors", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.date     "birth"
    t.text     "address",    limit: 65535
    t.string   "ctype",      limit: 255
    t.binary   "photo",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "authors", ["user_id"], name: "index_authors_on_user_id", using: :btree

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "author_id", limit: 4, null: false
    t.integer "book_id",   limit: 4, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "isbn",       limit: 255
    t.string   "title",      limit: 255
    t.integer  "price",      limit: 4
    t.string   "publish",    limit: 255
    t.date     "published"
    t.boolean  "cd"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "fan_comments", force: :cascade do |t|
    t.integer  "author_no",  limit: 4
    t.string   "name",       limit: 255
    t.text     "body",       limit: 65535
    t.boolean  "deleted"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "memos", force: :cascade do |t|
    t.string   "memoable_type", limit: 255
    t.integer  "memoable_id",   limit: 4
    t.string   "body",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",      limit: 255
    t.string   "password",      limit: 255
    t.string   "salt",          limit: 255
    t.string   "email",         limit: 255
    t.boolean  "dm"
    t.string   "roles",         limit: 255
    t.integer  "reviews_count", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "authors", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
