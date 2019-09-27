class CourseManagement < ApplicationRecord
  belongs_to :course
  belongs_to :user
  scope :load_course_managements, ->(course_id){where course_id: course_id}
end
