class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :load_user, except: [:index, :new, :create]
  before_action :correct_user, only: [:edit, :update]
  before_action :correct_permission, only: [:index, :destroy]

  def index
    @users = User.sort_by_created_at.paginate per_page: Settings.per_page_user,
      page: params[:page]
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".active_email"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".update_success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email,
      :password, :password_confirmation
  end

  def correct_user
    redirect_to(root_url) unless current_user? @user
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".user_notfound"
    redirect_to root_path
  end

  def correct_permission
    redirect_to user_path(current_user) unless
      current_user.trainer? || current_user.admin?
  end
end
