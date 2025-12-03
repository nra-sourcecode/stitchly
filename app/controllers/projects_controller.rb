class ProjectsController < ApplicationController

  def index
    @ongoing_projects = current_user.projects.where(status: "ongoing")
    @finished_projects = current_user.projects.where(status: "finished")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      yarn_params
      ids = params[:project][:yarn_ids]
      ids.each do |yarn_id|
        ProjectYarn.create!(yarn: Yarn.find(yarn_id), project: @project)
      end

      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :designer, :category, :needle_size, :product_size, :difficulty)
  end

    def yarn_params
      params.require(:project).permit(:yarn_ids)
    end

end
# before_action :authenticate_user!

  # Home page showing two swimlanes
