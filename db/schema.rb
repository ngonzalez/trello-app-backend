# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_27_201029) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "name", null: false
    t.string "item_id", null: false
    t.string "url", null: false
    t.string "short_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_boards_on_item_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name", null: false
    t.string "item_id", null: false
    t.string "list_id", null: false
    t.string "desc", null: false
    t.integer "pos", null: false
    t.datetime "due", null: false
    t.datetime "start", null: false
    t.boolean "due_complete", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_cards_on_item_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name", null: false
    t.string "item_id", null: false
    t.string "board_id", null: false
    t.boolean "closed", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_lists_on_item_id"
  end

end