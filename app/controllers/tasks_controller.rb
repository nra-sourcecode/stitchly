class TasksController < ApplicationController

  def update
    @task = Task.find(params[:id])
    @task.update!(task_params)
    @task.update!(state: true)
    raise
    @task.project.project_complete?
    @task.project.update(project_params)
    redirect_to project_path(@task.project)
  end

  private

  def task_params
    params.require(:task).permit(:comment)
  end

  def project_params
    params.require(:project).permit(images: [])
  end
end
