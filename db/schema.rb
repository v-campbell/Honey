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

ActiveRecord::Schema.define(version: 20200521210507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisements", force: :cascade do |t|
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_given"
    t.integer "value"
    t.integer "bee_id"
  end

  create_table "combs", force: :cascade do |t|
    t.integer "sweet_spot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hive_id"
  end

  create_table "hives", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nectar_dosages", force: :cascade do |t|
    t.integer "bee_id"
    t.date "date_given"
    t.integer "nectar_dosage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bee_id"], name: "index_nectar_dosages_on_bee_id"
  end

  create_table "pollen_collecteds", force: :cascade do |t|
    t.integer "bee_id"
    t.date "date_collected"
    t.integer "pollen_globs_collected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bee_id"], name: "index_pollen_collecteds_on_bee_id"
  end

  create_table "worker_bees", force: :cascade do |t|
    t.integer "comb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
