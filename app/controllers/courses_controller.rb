class CoursesController < ApplicationController
  before_action :logged_in_user
  before_action :load_course, only: :show

  def index
    @course_opens = Course.is_open.sort_by_created_at
                          .paginate per_page: Settings.per_page,
                            page: params[:page]
    return if current_user.traine?
    @course_closes = Course.is_close.sort_by_created_at
                           .paginate per_page: Settings.per_page,
                            page: params[:page]
  end

  def show; end

  private

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = t "controler.courses.not_f"
    redirect_to courses_path
  end
end
