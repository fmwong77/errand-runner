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

ActiveRecord::Schema.define(version: 5) do

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.integer "credit"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.integer "errand_id"
  end

  create_table "errands", force: :cascade do |t|
    t.integer "category_id"
    t.integer "user_id"
    t.integer "runner_user_id"
    t.string "description"
    t.datetime "due_date"
  end

  create_table "replies", force: :cascade do |t|
    t.integer "comment_id"
    t.string "content"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
  end

end
