class SessionsController < ApplicationController
  before_action :require_no_authentication, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by(name: params[:session][:name])

    if user and user.authenticate params[:session][:password]
      # login success
      session[:user_id] = user.id
      flash[:notice] = '登入成功！'
      redirect_to root_path
    else
      flash[:notice] = '帳號或密碼錯誤！'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id) if session[:user_id]
    flash[:notice] = '已登出！'
    redirect_to '/login'
  end

  private
  def require_no_authentication
    redirect_to root_path if current_user
  end
end
