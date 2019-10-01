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

ActiveRecord::Schema.define(version: 2019_09_18_040109) do

  create_table "course_managements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "time_join"
    t.datetime "time_leave"
    t.integer "status", default: 2
    t.bigint "course_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "created_at"], name: "index_course_managements_on_course_id_and_created_at"
    t.index ["course_id"], name: "index_course_managements_on_course_id"
    t.index ["user_id", "created_at"], name: "index_course_managements_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_course_managements_on_user_id"
  end

  create_table "course_subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.bigint "subject_id"
    t.index ["course_id", "created_at"], name: "index_course_subjects_on_course_id_and_created_at"
    t.index ["course_id"], name: "index_course_subjects_on_course_id"
    t.index ["subject_id", "created_at"], name: "index_course_subjects_on_subject_id_and_created_at"
    t.index ["subject_id"], name: "index_course_subjects_on_subject_id"
  end

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "thumbnail"
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer "status", default: 1
    t.integer "creator_id"
    t.integer "day_learn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "log_activities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_log_activities_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_log_activities_on_user_id"
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "thumbnail"
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer "status", default: 1
    t.integer "creator_id"
    t.integer "course_id"
    t.integer "day_learn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "label"
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer "status", default: 1
    t.integer "creator_id"
    t.integer "day_learn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.index ["subject_id", "created_at"], name: "index_tasks_on_subject_id_and_created_at"
    t.index ["subject_id"], name: "index_tasks_on_subject_id"
  end

  create_table "user_subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "time_join"
    t.datetime "time_leave"
    t.integer "status", default: 1
    t.bigint "user_id"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id", "created_at"], name: "index_user_subjects_on_subject_id_and_created_at"
    t.index ["subject_id"], name: "index_user_subjects_on_subject_id"
    t.index ["user_id", "created_at"], name: "index_user_subjects_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_user_subjects_on_user_id"
  end

  create_table "user_tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer "status", default: 1
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.index ["task_id", "created_at"], name: "index_user_tasks_on_task_id_and_created_at"
    t.index ["task_id"], name: "index_user_tasks_on_task_id"
    t.index ["user_id", "created_at"], name: "index_user_tasks_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_user_tasks_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name"
    t.string "avatar"
    t.string "email"
    t.string "address"
    t.string "phone"
    t.string "password"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "course_managements", "courses"
  add_foreign_key "course_managements", "users"
  add_foreign_key "course_subjects", "courses"
  add_foreign_key "course_subjects", "subjects"
  add_foreign_key "log_activities", "users"
  add_foreign_key "tasks", "subjects"
  add_foreign_key "user_subjects", "subjects"
  add_foreign_key "user_subjects", "users"
  add_foreign_key "user_tasks", "tasks"
  add_foreign_key "user_tasks", "users"
end
