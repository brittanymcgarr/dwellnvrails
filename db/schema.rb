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

ActiveRecord::Schema.define(version: 20170224055015) do

  create_table "listings", force: :cascade do |t|
    t.text     "description"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "primary_contact"
    t.string   "secondary_contact"
    t.string   "listing_status"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "picture"
    t.integer  "asking_price"
    t.boolean  "renobb"
    t.index ["user_id", "created_at"], name: "index_listings_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "relationship_listings", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "listing_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["follower_id", "listing_id"], name: "index_relationship_listings_on_follower_id_and_listing_id", unique: true
    t.index ["follower_id"], name: "index_relationship_listings_on_follower_id"
    t.index ["listing_id"], name: "index_relationship_listings_on_listing_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "primary_phone"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "portrait"
    t.boolean  "team",              default: false
    t.text     "biography"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
