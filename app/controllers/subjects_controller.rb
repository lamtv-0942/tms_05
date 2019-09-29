class SubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :load_subject, only: :show

  def show; end

  private

  def load_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject
    flash[:danger] = t "controller.subjects.subject_notfound"
    redirect_to courses_path
  end
end
