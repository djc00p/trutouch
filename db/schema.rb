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

ActiveRecord::Schema[7.1].define(version: 2022_08_09_134024) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "validation"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "appointment_addresses", force: :cascade do |t|
    t.boolean "pickup", null: false
    t.boolean "drop_off", null: false
    t.string "distance"
    t.string "distance_units", default: "miles"
    t.string "excess_distance_upcharge"
    t.time "estimated_drive_time"
    t.string "special_instructions"
    t.bigint "address_id"
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_appointment_addresses_on_address_id"
    t.index ["appointment_id"], name: "index_appointment_addresses_on_appointment_id"
  end

  create_table "appointment_services", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "completed_at"
    t.string "estimated_cost"
    t.time "estimated_time_to_complete"
    t.string "actual_cost"
    t.time "time_to_completion"
    t.string "special_instructions"
    t.bigint "appointment_id"
    t.string "service_type"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_appointment_services_on_appointment_id"
    t.index ["service_type", "service_id"], name: "index_appointment_services_on_service"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "began_at"
    t.datetime "finished_at"
    t.string "estimated_total_cost"
    t.time "estimated_total_time"
    t.boolean "pickup_drop_off"
    t.datetime "scheduled_for"
    t.datetime "scheduled_on"
    t.integer "services_count", default: 0, null: false
    t.string "status", default: "Pending"
    t.string "total_cost"
    t.time "total_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "vehicle_id"
    t.index ["customer_id"], name: "index_appointments_on_customer_id"
    t.index ["vehicle_id"], name: "index_appointments_on_vehicle_id"
  end

  create_table "clear_bra_services", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_clear_bra_services_on_name", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "prefered_method_of_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_email_uniqueness", unique: true
    t.index ["phone_number"], name: "index_customers_phone_number_uniqueness", unique: true
  end

  create_table "detail_services", force: :cascade do |t|
    t.string "name"
    t.integer "base_price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_detail_services_on_name", unique: true
  end

  create_table "production_vehicles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "production_year"
    t.string "vehicle_size"
    t.string "vehicle_type"
    t.string "vehicle_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tint_services", force: :cascade do |t|
    t.string "name"
    t.string "tint_manufacturer"
    t.string "vehicle_type"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number", limit: 15
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.string "google_token"
    t.string "status", default: "unverified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "verification_code"
    t.string "prefered_method_of_contact"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_users_on_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "year"
    t.string "color"
    t.string "make"
    t.string "model"
    t.string "classification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner_type"
    t.bigint "owner_id"
    t.index ["owner_type", "owner_id"], name: "index_vehicles_on_owner"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "customers"
  add_foreign_key "appointments", "vehicles"
  add_foreign_key "users", "customers"
end
