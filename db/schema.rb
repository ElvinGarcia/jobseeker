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

ActiveRecord::Schema.define(version: 20180404140223) do

  create_table "Companies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "job_postngs_id"
    t.string "password_digest"
    t.string "username"
    t.string "address"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "objective"
    t.string "github"
    t.string "blog"
    t.string "password_digest"
    t.string "username"
  end

  create_table "applicants_jobs", id: false, force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.integer "job_id", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "date"
    t.string "job_type"
    t.string "location"
    t.string "requirements"
    t.integer "salary"
    t.integer "company_id"
  end

end
