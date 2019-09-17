class SessionsController < ApplicationController
  before_action :load_user, only: :create

  def new; end

  def create
    const_remember_me = Settings.remember_me
    password = params_session :password
    remember_me = params_session :remember_me
    if @user&.authenticate(password)
      log_in @user
      remember_me == const_remember_me ? remember(@user) : forget(@user)
      redirect_back_or users_path
    else
      flash.now[:danger] = t ".invalid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def params_session argument
    params[:session][argument]
  end

  def load_user
    email = (params_session :email).downcase
    @user = User.find_by email: email
    return if @user
    flash[:danger] = I18n.t ".controller.admin.sessions.load_user.not_f"
  end
end
