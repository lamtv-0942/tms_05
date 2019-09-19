class Course < ApplicationRecord
  has_many :course_subjects
  has_many :subjects, through: :course_subjects

  has_many :course_managements
  has_many :users, through: :course_managements
end
