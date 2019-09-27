module CourseManagementsHelper
  def load_course_management course_management
    CourseManagement.load_course_managements course_management.course_id
  end

  def load_subjects course_management
    course_management.course.subjects.includes(:user)
  end
end
