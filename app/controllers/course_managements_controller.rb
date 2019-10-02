class CourseManagementsController < ApplicationController
  before_action :logged_in_user
  before_action :load_course_management, only: [:show, :destroy]
  before_action :course_management_params, only: :create
  before_action :check_course_management_is_activited, only: :destroy
  before_action :check_user_has_course_management, only: :add_user
  before_action :add_course_management_params, only: :add_user

  def index
    @course_activiteds = current_user.course_managements
                                     .sort_by_created_at.activited
                                     .paginate per_page: Settings.per_page,
                                     page: params[:page]
    @course_non_activiteds = current_user.course_managements
                                         .sort_by_created_at.non_activited
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

  def add_user
    @course_managements = CourseManagement.new add_course_management_params
    subject_ids = @course_managements.course.course_subjects
                                     .sort_by_order.pluck(:subject_id)
    begin
      ActiveRecord::Base.transaction do
        @course_managements.save
        update_user_subject(subject_ids, load_params(:user_id))
        flash[:success] = t "controller.course_managements.add_success"
      end
    rescue NoMethodError
      flash[:danger] = t "controller.course_managements.add_faild"
    end
    redirect_to courses_path(params[:course_management][:course_id])
  end

  private

  def update_user_subject subject_ids, user_id
    date_start = Time.now
    subject_ids.each do |subject_id|
      user_subject = UserSubject.new user_id: user_id, subject_id: subject_id,
                                     time_join: date_start
      user_subject.save
      date_start += Subject.find_by(id: subject_id).day_learn.days
    end
  end

  def load_params argument
    params[:course_management][argument]
  end

  def check_user_has_course_management
    user_id = load_params :user_id
    course_management_finds = CourseManagement.where user_id: user_id
    course_management_finds.each do |course_management|
      if course_management.activited?
        flash[:danger] = t ".controller.course_managements.user_has_course"
        return redirect_to courses_path
      end
    end
  end

  def add_course_management_params
    params.require(:course_management).permit :course_id, :user_id, :status
  end

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
