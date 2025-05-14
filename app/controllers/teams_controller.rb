class TeamsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:join]

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      current_user.teams << @team
      redirect_to team_tasks_path(@team), notice: 'チームが作成されました'
    else
      render :new
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to team_tasks_path(@team), notice: 'チームが更新されました'
    else
      render :edit
    end
  end

  def invite
    @team_invite = Team.find_by(invite_token: params[:invite_token])
    return if @team_invite

    redirect_to root_path, alert: '無効な招待リンクです'
  end

  def join
    @invite_team = Team.find_by(invite_token: params[:invite_token])
    if @invite_team && current_user.teams.exclude?(@invite_team)
      current_user.teams << @invite_team
      redirect_to team_tasks_path(@invite_team), notice: 'チームに参加しました'
    else
      redirect_to root_path, alert: '参加できませんでした'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.tasks.destroy_all
    @team.team_users.destroy_all
    @team.destroy
    redirect_to root_path, notice: 'チームが削除されました'
  end

  private

  def team_params
    params.expect(team: [:name])
  end
end
