class MissionsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @missions = Mission.order(sort_column + ' ' + sort_direction)
    # @missions = @missions.where('title LIKE ? OR context LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(10)

    # 管理者可看到全部任務
    if current_user.is_admin
      @q = Mission.ransack(params[:q])
      @missions = @q.result.page(params[:page]).per(10)
    else
      @q = current_user.missions.ransack(params[:q])
      @missions = @q.result.page(params[:page]).per(10)
    end
  end

  def new
    @mission = Mission.new
  end
  
  def create
    @mission = current_user.missions.build mission_params

    if @mission.save
      redirect_to user_missions_path(current_user), notice: I18n.t("notice.create_success", name: '任務')
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find_by(id: params[:id])
  end

  def update
    @mission = Mission.find_by(id: params[:id])

    if @mission.update(mission_params)
      redirect_to user_missions_path(current_user), notice: I18n.t("notice.update_success", name: '任務')
    else
      render :edit
    end
  end

  def destroy
    @mission = Mission.find_by(id: params[:id])
    @mission.destroy if @mission
    redirect_to user_missions_path(current_user), notice: I18n.t("notice.delete_success", name: '任務')
  end

  private
  def mission_params
    params.require(:mission).permit(:title, :context, :status, :priority, :start_time, :end_time, :user_id)
  end

  def authenticate_user!
    redirect_to root_path, notice: '請先登入！' unless current_user
  end
end
