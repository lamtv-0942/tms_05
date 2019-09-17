class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  layout :load_layout

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t ".login"
    redirect_to login_url
  end

  def correct_user
    redirect_to(root_url) unless current_user? @user
  end

  def correct_permission
    redirect_to user_path(current_user) unless
      current_user.trainer? || current_user.admin?
  end

  def correct_permission_admin
    redirect_to user_path(current_user) unless current_user.admin?
  end

  def load_layout
    return "admin" if current_user&.admin?
    "application"
  end
end
