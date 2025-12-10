class TasksController < ApplicationController

  def update
    @task = Task.find(params[:id])
    @project = @task.project
    @task.update!(task_params)
    @task.update!(state: true)
   # fetch images from the form
    images = params.dig(:project, :images)

    if images.present?
      cleaned_images = images.reject(&:blank?)
      cleaned_images.each do |image|
        @project.images.attach(image)
      end
    end
    @task.project.project_complete?
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
