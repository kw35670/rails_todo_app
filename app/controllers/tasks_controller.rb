class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_team, only: [:index, :new, :create]

  def index
    @team ||= current_user.last_joined_team if current_user
    @tasks = if @team
               Task.for_team(@team.id)
             else
               Task.for_user_teams(current_user)
             end
  end

  def show
  end

  def new
    @task = @team ? Task.new(team_id: @team.id) : Task.new
  end

  def edit
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.created_user = current_user.nickname
    @task.update_user = current_user.nickname

    if @task.save
      redirect_to team_tasks_path(@task.team), notice: 'タスクが正常に作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params.merge(update_user: current_user.nickname))
      redirect_to team_tasks_path(@task.team), notice: 'タスクが正常に更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    team = @task.team
    @task.destroy
    redirect_to team_tasks_path(team), notice: 'タスクが正常に削除されました。'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id]) if params[:team_id]
  end

  def task_params
    params.expect(task: [:name, :status, :team_id])
  end
end
