class TasksController < ApplicationController

  def update
    @task = Task.find(params[:id])
    @task.update(state: !@task.state)
    redirect_to project_path(@task.project)
  end
end
