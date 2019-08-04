class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :set_admin, :destroy, :show]

  #=================== admin only ===================
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy if @user
    redirect_to users_path, notice: '刪除成功！'
  end

  def set_admin
    @user = User.find_by(id: params[:id])

    if @user.update(is_admin: !@user.is_admin)
      redirect_to users_path, notice: '設定成功！'
    else
      render 'index'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @missions = @user.missions.page(params[:page]).per(10)
  end
  #=================== admin only ===================

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = '註冊成功！'
      redirect_to '/'
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :is_admin)
  end
  
  def authenticate_admin!
    redirect_to root_path, notice: '只有管理員可以使用！' unless current_user.is_admin
  end
end
