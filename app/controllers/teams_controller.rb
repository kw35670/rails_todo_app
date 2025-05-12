class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      current_user.teams << @team
      redirect_to team_tasks_path(@team), notice: "チームが作成されました"
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to team_tasks_path(@team), notice: "チームが更新されました"
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.tasks.destroy_all
    @team.team_users.destroy_all
    @team.destroy
    redirect_to root_path, notice: "チームが削除されました"
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
