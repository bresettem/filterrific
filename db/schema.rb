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

ActiveRecord::Schema.define(version: 20181009233705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains", force: :cascade do |t|
    t.boolean  "available"
    t.string   "currency"
    t.boolean  "definitive"
    t.string   "domain"
    t.integer  "period"
    t.bigint   "price"
    t.integer  "score"
    t.string   "spacer"
    t.string   "tld"
    t.string   "typ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain", "score"], name: "index_domains_on_domain_and_score", unique: true, using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "email"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tlds", force: :cascade do |t|
    t.string   "name"
    t.string   "typ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tlds_on_name", unique: true, using: :btree
  end

  create_table "words", force: :cascade do |t|
    t.string   "typ"
    t.string   "spacer"
    t.jsonb    "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word"], name: "index_words_on_word", unique: true, using: :btree
  end

end
