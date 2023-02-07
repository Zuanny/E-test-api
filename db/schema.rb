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

ActiveRecord::Schema[7.0].define(version: 2023_02_05_020423) do
  create_table "playlists", force: :cascade do |t|
    t.string "link"
    t.string "status"
    t.integer "user_id", null: false
    t.integer "video_rooms_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
    t.index ["video_rooms_id"], name: "index_playlists_on_video_rooms_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_room_users", force: :cascade do |t|
    t.date "login_date"
    t.integer "user_id", null: false
    t.integer "video_rooms_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_video_room_users_on_user_id"
    t.index ["video_rooms_id"], name: "index_video_room_users_on_video_rooms_id"
  end

  create_table "video_rooms", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_video_rooms_on_user_id"
  end

  add_foreign_key "playlists", "users"
  add_foreign_key "playlists", "video_rooms", column: "video_rooms_id"
  add_foreign_key "video_room_users", "users"
  add_foreign_key "video_room_users", "video_rooms", column: "video_rooms_id"
  add_foreign_key "video_rooms", "users"
end
