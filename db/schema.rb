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

ActiveRecord::Schema.define(:version => 20120917115447) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "house_number"
    t.string   "city"
    t.string   "postcode"
    t.integer  "profile_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "commentable"
    t.integer  "group"
    t.boolean  "sticky"
  end

  create_table "attachments", :force => true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "file_file_name"
    t.datetime "file_updated_at"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "group"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.integer  "article_id"
  end

  add_index "galleries", ["user_id"], :name => "index_galleries_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "menu_title"
    t.text     "content"
    t.boolean  "navbar"
    t.boolean  "menu"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "gallery_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "email"
    t.string   "telephone"
    t.string   "im_jabber"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.date     "birthdate"
    t.string   "birthnumber"
    t.string   "vzs_id"
  end

  create_table "shows", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.time     "meet_time"
    t.time     "end_time"
    t.integer  "payed_hours"
    t.integer  "people"
    t.string   "meet_at"
    t.string   "contact"
    t.boolean  "breakfast"
    t.boolean  "lunch"
    t.boolean  "dinner"
    t.boolean  "club"
    t.text     "notes"
    t.text     "description"
    t.boolean  "paid"
    t.integer  "brigade_hours"
    t.boolean  "archived"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "show_id"
    t.integer  "user_id"
    t.boolean  "subscribed"
    t.boolean  "wants_payed"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "subscriptions", ["show_id"], :name => "index_subscriptions_on_show_id"
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "group"
  end

end
