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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141024040354) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "balance",           precision: 8, scale: 2
    t.decimal  "balance_estimated", precision: 8, scale: 2
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payees", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_templates", force: true do |t|
    t.string   "info"
    t.decimal  "amount"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "transaction_type"
    t.integer  "category_id"
  end

  add_index "transaction_templates", ["category_id"], name: "index_transaction_templates_on_category_id"

  create_table "transactions", force: true do |t|
    t.integer  "category_id"
    t.integer  "account_id"
    t.string   "info"
    t.float    "amount_estimated"
    t.float    "amount"
    t.date     "date_estimated"
    t.date     "date_transaction"
    t.boolean  "commited"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payee_id"
    t.text     "description"
    t.integer  "transaction_type"
    t.integer  "index"
    t.decimal  "amount_show",           precision: 8, scale: 2
    t.decimal  "amount_show_estimated", precision: 8, scale: 2
  end

  add_index "transactions", ["payee_id"], name: "index_transactions_on_payee_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
