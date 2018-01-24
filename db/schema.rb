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

ActiveRecord::Schema.define(version: 20180118030458) do

  create_table "JobPostings", force: :cascade do |t|
    t.string "title"
    t.string "date"
    t.string "type"
    t.string "location"
    t.string "requirements"
    t.integer "salary"
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

  create_table "benefits", force: :cascade do |t|
    t.string "insurance"
    t.string "education"
    t.string "travel"
    t.string "vacation"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "job_postngs_id"
    t.string "benefits_id"
  end

  create_table "jobs_benefits", force: :cascade do |t|
    t.integer "job_postngs_id"
    t.integer "benefits_id"
  end

end
