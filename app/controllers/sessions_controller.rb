class SessionsController < ApplicationController
  before_action :load_user, only: :create

  def new; end

  def create
    if @user.authenticate params_session(:password)
      log_in @user
      remember_me = params_session :remember_me
      remember_me == Settings.remember_me ? remember(@user) : forget(@user)
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
    @user = User.find_by email: params_session(:email)
    return if @user
    flash[:danger] = t ".controller.admin.sessions.load_user.not_f"
    redirect_to root_path
  end
end
