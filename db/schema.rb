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

ActiveRecord::Schema[7.0].define(version: 2023_03_08_205332) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bixes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.integer "curso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bixes_items", force: :cascade do |t|
    t.bigint "bixe_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bixe_id"], name: "index_bixes_items_on_bixe_id"
    t.index ["item_id"], name: "index_bixes_items_on_item_id"
  end

  create_table "bixes_modalidades", force: :cascade do |t|
    t.bigint "bixe_id", null: false
    t.bigint "modalidade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bixe_id"], name: "index_bixes_modalidades_on_bixe_id"
    t.index ["modalidade_id"], name: "index_bixes_modalidades_on_modalidade_id"
  end

  create_table "confirmacoes", force: :cascade do |t|
    t.bigint "bixe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bixe_id"], name: "index_confirmacoes_on_bixe_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "nome"
    t.decimal "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modalidades", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bixes_items", "bixes"
  add_foreign_key "bixes_items", "items"
  add_foreign_key "bixes_modalidades", "bixes"
  add_foreign_key "bixes_modalidades", "modalidades"
  add_foreign_key "confirmacoes", "bixes"
end
