# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_15_083229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_books", comment: "アカウントと本の中間テーブル", force: :cascade do |t|
    t.bigint "account_id", null: false, comment: "アカウントID"
    t.bigint "book_id", null: false, comment: "本ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_books_on_account_id"
    t.index ["book_id"], name: "index_account_books_on_book_id"
  end

  create_table "accounts", comment: "アカウント", force: :cascade do |t|
    t.string "name", null: false, comment: "アカウントの名前"
    t.string "code_name", null: false, comment: "アカウントのコードネーム"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "authors", comment: "著者", force: :cascade do |t|
    t.string "name", null: false, comment: "著者名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", comment: "本", force: :cascade do |t|
    t.string "title", null: false, comment: "タイトル"
    t.string "code", null: false, comment: "本コード(ASINがあるとは限らないため)"
    t.string "image_url", comment: "画像URL"
    t.bigint "author_id", comment: "著者ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  add_foreign_key "account_books", "accounts"
  add_foreign_key "account_books", "books"
  add_foreign_key "books", "authors"
end
