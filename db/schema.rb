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

ActiveRecord::Schema.define(version: 20171008181358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carrinhos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "linha_items", force: :cascade do |t|
    t.integer "produto_id"
    t.integer "carrinho_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantidade", default: 1
    t.integer "pedido_id"
    t.index ["carrinho_id"], name: "index_linha_items_on_carrinho_id"
    t.index ["pedido_id"], name: "index_linha_items_on_pedido_id"
    t.index ["produto_id"], name: "index_linha_items_on_produto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "nome"
    t.text "endereco"
    t.string "email"
    t.integer "tipo_pagamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string "titulo"
    t.string "image_url"
    t.decimal "preco", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "widgets", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
