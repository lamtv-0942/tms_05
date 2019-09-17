class Admin::CoursesController < ApplicationController
  before_action :load_course, only: [:show, :edit, :update]
  before_action :correct_permission

  def index
    @courses = Course.sort_by_created_at.paginate per_page: Settings.per_page,
      page: params[:page]
  end

  def show; end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build course_params
    if @course.save
      flash[:success] = t ".controller.admin.courses.create.success"
      redirect_to admin_courses_path
    else
      flash[:danger] = t ".controller.admin.courses.create.faild"
      render :new
    end
  end

  def edit; end

  def update
    if @course.update_attributes(course_params)
      flash[:success] = t "controller.admin.courses.update.success"
      redirect_to admin_courses_path(@course)
    else
      flash[:danger] = t "controller.admin.courses.update.faild"
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit :thumbnail, :name, :description, :time_start,
      :time_end, :status, :creator_id
  end

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = I18n.t "controller.admin.courses.load_course.not_f"
    redirect_to admin_courses_path
  end

  def correct_permission
    redirect_to user_path(current_user) unless
      current_user.trainer? || current_user.admin?
  end
end
