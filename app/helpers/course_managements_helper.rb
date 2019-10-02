module CourseManagementsHelper
  def load_course_management_course course_management
    CourseManagement.load_course_managements course_management.course_id
  end

  def load_course_subject course_management
    course_management.course.course_subjects.sort_by_order
  end

  def load_start_day course_management
    course_management.user.user_subjects.sort_by_order.first.time_join
  end

  def load_user_is_traine_course_management course_id
    user_ids = CourseManagement
               .load_course_managements_and_has_activited(course_id)
               .pluck(:user_id)
    user_ids.blank? ? User.traine : User.load_user_not(user_ids).traine
  end
end
