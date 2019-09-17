module CoursesHelper
  def check_join_course_management course_id
    current_user.course_managements.find_by(course_id: course_id)
  end

  def load_course_management course
    CourseManagement.load_course_managements(course.id)
  end

  def load_user_is_traine course_id
    user_ids = CourseManagement
               .load_course_managements(course_id)
               .activited
               .pluck(:user_id)
    return User.traine.pluck(:full_name, :id) if user_ids.blank?
    User.load_user_not(user_ids).traine
        .pluck(:full_name, :id)
  end

  def load_course_management_has_course_is_activited course
    course.course_managements.activited
  end
end
