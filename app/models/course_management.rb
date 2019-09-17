class CourseManagement < ApplicationRecord
  enum status: {activited: 1, non_activited: 2}
  belongs_to :course
  belongs_to :user

  scope :load_course_managements, ->(course_id){where course_id: course_id}
  scope :by_user, ->(id){where user_id: id}

  delegate :full_name, to: :user
end
