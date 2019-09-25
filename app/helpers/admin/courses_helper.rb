module Admin::CoursesHelper
  def get_creator id
    user = User.find_by id: id
    return user.full_name if user
    flash[:danger] = t ".helper.admin.courses.not_f"
    redirect_to :back
  end

  def get_status course
    if course.is_open?
      content_tag(:span, t(".helper.admin.courses.open"),
        class: "btn btn-primary btn-xs")
    else
      content_tag(:span, t(".helper.admin.courses.close"),
        class: "btn btn-danger btn-xs")
    end
  end

  def get_status_select
    Course.statuses
  end
end
