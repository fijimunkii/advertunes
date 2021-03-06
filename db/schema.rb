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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131213204024) do

  create_table "feelings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feelings_songs", :id => false, :force => true do |t|
    t.integer "feeling_id"
    t.integer "song_id"
  end

  add_index "feelings_songs", ["feeling_id", "song_id"], :name => "index_feelings_songs_on_feeling_id_and_song_id"
  add_index "feelings_songs", ["song_id"], :name => "index_feelings_songs_on_song_id"

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "genres_songs", :id => false, :force => true do |t|
    t.integer "genre_id"
    t.integer "song_id"
  end

  add_index "genres_songs", ["genre_id", "song_id"], :name => "index_genres_songs_on_genre_id_and_song_id"
  add_index "genres_songs", ["song_id"], :name => "index_genres_songs_on_song_id"

  create_table "registrations", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "songs", :force => true do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "permalink"
    t.text     "description"
    t.integer  "num_stars",   :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "stars", :force => true do |t|
    t.integer  "song_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "soundcloud_user_id"
    t.string   "soundcloud_username"
    t.string   "soundcloud_access_token"
    t.string   "soundcloud_refresh_token"
    t.datetime "soundcloud_expires_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
