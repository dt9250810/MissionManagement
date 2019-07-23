class MissionsController < ApplicationController
  def index
    @missions = Mission.all
  end

  def new
    @mission = Mission.new
  end
  
  def create
    @mission = Mission.new(mission_params)

    if @mission.save
      redirect_to missions_path, notice: "新增任務成功！"
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
      redirect_to missions_path, notice: "更新任務成功！"
    else
      render :edit
    end
  end

  def destroy
    @mission = Mission.find_by(id: params[:id])
    @mission.destroy if @mission
    redirect_to missions_path, notice: "刪除成功！"
  end

  private
  def mission_params
    params.require(:mission).permit(:title, :context, :status, :priority, :start_time, :end_time)
  end
end
