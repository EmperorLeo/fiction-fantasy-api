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

ActiveRecord::Schema.define(version: 20161019030120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_archetypes", force: :cascade do |t|
    t.string   "name",           limit: 40
    t.text     "description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "typical_traits",                         array: true
  end

  create_table "character_personalities", force: :cascade do |t|
    t.string   "name",        limit: 40
    t.string   "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "characters", force: :cascade do |t|
    t.integer  "story_template_id"
    t.string   "full_name"
    t.string   "nickname",               limit: 20
    t.text     "background_info"
    t.integer  "character_type",         limit: 2
    t.integer  "character_archetype_id"
    t.string   "hair_color",             limit: 40
    t.string   "eye_color",              limit: 40
    t.string   "species",                limit: 40
    t.string   "planet",                 limit: 40
    t.string   "nationality",            limit: 40
    t.string   "ancestry",               limit: 40
    t.string   "occupation",             limit: 40
    t.integer  "orientation",            limit: 2
    t.string   "gender",                 limit: 40
    t.integer  "personality_traits",                             array: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["character_archetype_id"], name: "index_characters_on_character_archetype_id", using: :btree
    t.index ["story_template_id"], name: "index_characters_on_story_template_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name",        limit: 40
    t.string   "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "story_chapters", force: :cascade do |t|
    t.integer  "story_template_id"
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["story_template_id"], name: "index_story_chapters_on_story_template_id", using: :btree
  end

  create_table "story_place_settings", force: :cascade do |t|
    t.string   "name",        limit: 40
    t.string   "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "story_place_settings_entries", force: :cascade do |t|
    t.integer  "story_template_id"
    t.integer  "story_place_setting_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["story_place_setting_id"], name: "index_story_place_settings_entries_on_story_place_setting_id", using: :btree
    t.index ["story_template_id"], name: "index_story_place_settings_entries_on_story_template_id", using: :btree
  end

  create_table "story_templates", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "narration",          limit: 2
    t.text     "main_idea"
    t.text     "intro_desc"
    t.text     "rising_action_desc"
    t.text     "climax_desc"
    t.text     "conclusion_desc"
    t.text     "world_building"
    t.integer  "stage",              limit: 2
    t.integer  "sequel_id"
    t.string   "author_video_url",   limit: 80
    t.string   "book_cover_url",     limit: 80
    t.integer  "genre_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["author_id"], name: "index_story_templates_on_author_id", using: :btree
    t.index ["genre_id"], name: "index_story_templates_on_genre_id", using: :btree
    t.index ["sequel_id"], name: "index_story_templates_on_sequel_id", using: :btree
  end

  create_table "story_time_settings", force: :cascade do |t|
    t.string   "name",        limit: 40
    t.string   "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "story_time_settings_entries", force: :cascade do |t|
    t.integer  "story_template_id"
    t.integer  "story_time_setting_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["story_template_id"], name: "index_story_time_settings_entries_on_story_template_id", using: :btree
    t.index ["story_time_setting_id"], name: "index_story_time_settings_entries_on_story_time_setting_id", using: :btree
  end

  create_table "user_favorite_works", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.string   "favorite_desc"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_user_favorite_works_on_user_id", using: :btree
    t.index ["work_id"], name: "index_user_favorite_works_on_work_id", using: :btree
  end

  create_table "user_genres", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "genre_id"
    t.string   "associations"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["genre_id"], name: "index_user_genres_on_genre_id", using: :btree
    t.index ["user_id"], name: "index_user_genres_on_user_id", using: :btree
  end

  create_table "user_settings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "page_animation",  limit: 2
    t.integer  "website_theme_1"
    t.integer  "website_theme_2"
    t.integer  "website_theme_3"
    t.integer  "website_theme_4"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_user_settings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",         limit: 40
    t.string   "last_name",          limit: 40
    t.string   "email",              limit: 40
    t.string   "phone_number",       limit: 20
    t.string   "author_picture_url", limit: 80
    t.text     "author_profile"
    t.integer  "followers"
    t.integer  "following"
    t.string   "password_digest"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "works", force: :cascade do |t|
    t.string   "title",             limit: 40
    t.string   "picture_url",       limit: 80
    t.string   "author_last_name",  limit: 40
    t.string   "author_first_name", limit: 40
    t.integer  "genre_id"
    t.integer  "work_type",         limit: 2
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["genre_id"], name: "index_works_on_genre_id", using: :btree
  end

  add_foreign_key "characters", "character_archetypes"
  add_foreign_key "characters", "story_templates"
  add_foreign_key "story_chapters", "story_templates", on_delete: :cascade
  add_foreign_key "story_place_settings_entries", "story_place_settings"
  add_foreign_key "story_place_settings_entries", "story_templates"
  add_foreign_key "story_templates", "genres"
  add_foreign_key "story_templates", "story_templates", column: "sequel_id", on_delete: :nullify
  add_foreign_key "story_templates", "users", column: "author_id", on_delete: :cascade
  add_foreign_key "story_time_settings_entries", "story_templates"
  add_foreign_key "story_time_settings_entries", "story_time_settings"
  add_foreign_key "user_favorite_works", "users"
  add_foreign_key "user_favorite_works", "works"
  add_foreign_key "user_genres", "genres"
  add_foreign_key "user_genres", "users"
  add_foreign_key "user_settings", "users", on_delete: :cascade
  add_foreign_key "works", "genres"
end
