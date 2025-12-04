class ProjectsController < ApplicationController
  def home
    @ongoing_projects = current_user.projects.where(status: "ongoing")
    @finished_projects = current_user.projects.where(status: "finished")
    @footer = true
    @navbar = true
    @text = "Home"
  end

  def index
    @text = "My Projects"
    @navbar = true
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @text = "Adding My Project"
    @navbar = true
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      yarn_params
      ids = params[:project][:yarn_ids].reject(&:blank?)
      @amount = params[:project][:project_yarn][:amount]
      @amount = @amount.to_i
      ids.each do |yarn_id|
        ProjectYarn.create!(yarn: Yarn.find(yarn_id.to_i), project: @project, amount: @amount)
      end


      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:title, :designer, :category, :needle_size, :product_size, :difficulty, :pattern, images: [], project_yarns_attributes: [:id, :yarn_id, :amount])
  end

  def yarn_params
    params.require(:project).permit(:yarn_ids)
  end

  def project_yarn_params
      params.require(:project).permit(:amount)
  end
end
