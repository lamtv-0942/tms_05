class User < ApplicationRecord
  enum :role [admin: 1, trainer: 2, traine: 3]
  has_many :log_activities, dependent: :destroy

  has_many :user_tasks
  has_many :tasks, through: :user_tasks

  has_many :user_subjects
  has_many :subjects, through: :user_subjects

  has_many :course_managements
  has_many :courses, through: :course_managements
end
