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

ActiveRecord::Schema.define(version: 20171020044552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "containers", force: :cascade do |t|
    t.string "codigo"
    t.boolean "entregado", default: false
    t.date "fecha_devolucion"
    t.date "fecha_limite_devolucion"
    t.date "inicio_de_mora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "ingreso_a_bodega"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_containers_on_user_id"
  end

  create_table "navieras", force: :cascade do |t|
    t.string "nombre"
    t.string "telefono"
    t.string "nota"
  end

  create_table "products", force: :cascade do |t|
    t.string "nombre"
    t.string "referencia"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.string "telefono"
    t.string "email"
    t.string "direccion"
    t.string "password_digest"
    t.boolean "activo", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "cedula"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
