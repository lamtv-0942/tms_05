class CourseManagementsController < ApplicationController
  before_action :logged_in_user
  before_action :load_course_management, only: [:show, :destroy]
  before_action :course_management_params, only: :create
  before_action :check_course_management_is_activited, only: :destroy

  def index
    @course_managements = current_user.course_managements.sort_by_created_at
                                      .paginate per_page: Settings.per_page,
                                        page: params[:page]
  end

  def show; end

  def create
    @course_management = current_user.course_managements
                                     .build course_management_params
    @course_management.time_join = Time.now
    @course_management.status = CourseManagement.statuses[:joined]
    if @course_management.save
      flash[:success] = t "controller.course_managements.create_success"
    else
      flash[:danger] = t "controller.course_managements.create_failed"
    end
    redirect_to courses_path
  end

  def destroy
    if @course_management.destroy
      flash[:success] = t "controller.course_managements.deleted_success"
    else
      flash[:danger] = t "controller.course_managements.deleted_failed"
    end
    redirect_to courses_path
  end

  private

  def course_management_params
    params.require(:course_management).permit :course_id
  end

  def load_course_management
    @course_management = CourseManagement.find_by id: params[:id]
    return if @course_management
    flash[:danger] = t "controller.course_managements.not_f"
    redirect_to course_managements_path
  end

  def check_course_management_is_activited
    return unless @course_management.activited?
    flash[:danger] = t "controller.course_managements.not_leave"
    redirect_to courses_path
  end
end
