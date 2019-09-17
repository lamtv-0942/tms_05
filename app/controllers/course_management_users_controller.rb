class CourseManagementUsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_permission
  before_action :check_user_has_course_management,
    :course_management_params, only: :create

  def create
    @course_management = CourseManagement.new course_management_params
    if @course_management.save
      flash[:success] = t "controller.course_managements.add_success"
    else
      flash[:danger] = t "controller.course_managements.add_failed"
    end
    redirect_to courses_path params[:course_management][:course_id]
  end

  private

  def check_user_has_course_management
    user_id = params[:course_management][:user_id]
    course_finds = CourseManagement.by_user(user_id).activited
    return if course_finds.blank?
    flash[:danger] = t ".controller.course_managements.user_has_course"
    redirect_to courses_path
  end

  def course_management_params
    params.require(:course_management).permit :course_id, :user_id, :status
  end
end
