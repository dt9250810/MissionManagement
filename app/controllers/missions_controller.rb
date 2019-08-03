class MissionsController < ApplicationController
  def index
    @missions = Mission.order(sort_column + ' ' + sort_direction)
  end

  def new
    @mission = Mission.new
  end
  
  def create
    @mission = Mission.new(mission_params)

    if @mission.save
      redirect_to missions_path, notice: I18n.t("notice.create_success", name: '任務')
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
      redirect_to missions_path, notice: I18n.t("notice.update_success", name: '任務')
    else
      render :edit
    end
  end

  def destroy
    @mission = Mission.find_by(id: params[:id])
    @mission.destroy if @mission
    redirect_to missions_path, notice: I18n.t("notice.delete_success", name: '任務')
  end

  private
  def mission_params
    params.require(:mission).permit(:title, :context, :status, :priority, :start_time, :end_time)
  end

  def sort_column
    params[:sort] || "created_at"
  end

  def sort_direction
    params[:direction] || "desc"
  end
end
