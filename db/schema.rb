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

ActiveRecord::Schema[7.0].define(version: 2022_12_20_133232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enderecos", force: :cascade do |t|
    t.string "cep", limit: 8, null: false
    t.string "longr", limit: 50, null: false
    t.string "complemento", limit: 50
    t.string "bairro", limit: 80, null: false
    t.string "cidade", limit: 30, null: false
    t.string "uf", limit: 2, null: false
    t.string "cdg_ibge", limit: 7
    t.integer "municipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipes", force: :cascade do |t|
    t.string "nome", limit: 80, null: false
    t.string "cpf", limit: 11, null: false
    t.string "cns", limit: 15, null: false
    t.string "email", limit: 256, null: false
    t.date "dta_nasc", null: false
    t.string "telefone", limit: 13, null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enderecos", "municipes"
end
