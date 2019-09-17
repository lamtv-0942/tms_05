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

  def load_layout
    return "admin" if current_user&.admin?
    "application"
  end
end
