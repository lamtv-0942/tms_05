class Admin::SubjectsController < ApplicationController
  before_action :load_subject, except: [:index, :create, :new]

  def index
    @subjects = Subject.sort_subject
                       .paginate per_page: Settings.parger, page: params[:page]
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "controller.admin.subjects.save_success"
      redirect_to admin_subjects_path
    else
      flash[:danger] = t "controller.admin.subjects.save_error"
      render :new
    end
  end

  def edit; end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "controller.admin.subjects.update_success"
      redirect_to admin_subjects_path
    else
      flash[:danger] = t "controller.admin.subjects.update_error"
      render :edit
    end
  end

  private

  def subject_params
    params.require(:subject).permit :id, :name, :description, :thumbnail,
      :time_start, :time_end, :status
  end

  def load_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject
    flash[:warning] = t "controller.admin.subjects.not_find"
    redirect_to admin_subjects_path
  end
end
