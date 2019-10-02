class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  scope :sort_by_order, ->{order order: :asc}
  scope :load_course_subject, ->(id){where "course_id = ? AND course_subjects.order = 1", id}
end
