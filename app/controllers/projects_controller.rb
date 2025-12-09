class ProjectsController < ApplicationController
  require "json"

  SYSMTEM_PROMPT = "Read the PDF and extract EXACTLY 5 steps.
    This number may NOT be more or less than 5.
    Do NOT infer additional steps. Merge or simplify content so you always end up with EXACTLY 5 steps.

    The output must be a JSON array with EXACTLY 5 objects.
    Each object must have the following two keys only:
      - step_title: a short title
      - step_description: a short explanation

    Your output MUST follow this format exactly:

    [
      { step_title: ..., step_description: ... },
      { step_title: ..., step_description: ... },
      { step_title: ..., step_description: ... },
      { step_title: ..., step_description: ... },
      { step_title: ..., step_description: ... }
    ]

    Do not include any text before or after the JSON.
  PROMPT"


  def home
    @not_started_projects = current_user.projects.where(status: "not started").limit(2)
    @ongoing_projects     = current_user.projects.where(status: "ongoing").limit(2)
    @finished_projects    = current_user.projects.where(status: "finished").limit(2)

    # will be updated later when the status is ready
    # @projects = current_user.projects.limit(2)
    @navbar = true
    @text = "Home"
  end

  def index
    @projects = current_user.projects.where(status: "ongoing").or(current_user.projects.where(status: "not started"))
    @text = "My Ongoing Projects"
    @navbar = true
  end

  def finish
    @finished_projects = current_user.projects.where(status: "finished")
    @text = "My Finished Projects"
    @navbar = true
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
    task_response


      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
    @text = "My Project"
    @navbar = true
  end

  def start
    @project = Project.find(params[:id])
    @project.update(status: "ongoing")
    redirect_to project_path(@project)
  end


  def task_response
    if @project.pattern.attached?
    @ruby_llm_chat = RubyLLM.chat(model: "gemini-2.0-flash")
    @response = @ruby_llm_chat.ask(SYSMTEM_PROMPT, with: {pdf: @project.pattern.url})
    @tasks_array = JSON.parse(@response.content[7...-3])
    @tasks_array.each do |task|
      newtask = Task.new(description: task["step_description"], title: task["step_title"])
      newtask.project = @project
      newtask.save
    end
    end
  end

def edit
  @project = Project.find(params[:id])
  @text = "Edit My Project"
  @navbar = true
end

def update
  @project = Project.find(params[:id])

  if @project.update(project_params)
    redirect_to project_path(@project)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @project = Project.find(params[:id])
  @project.yarns.destroy_all
  @project.tasks.destroy_all
  @project.destroy
  redirect_to projects_path, status: :see_other
end



  private

  def project_params
    params.require(:project).permit(:title, :designer, :category, :needle_size, :product_size, :difficulty, :pattern, images: [], project_yarns_attributes: [:id, :yarn_id, :amount], task_attributes: [:id, :comment])
  end

  def yarn_params
    params.require(:project).permit(:yarn_ids)
  end

  def project_yarn_params
      params.require(:project).permit(:amount)
  end

  def task_params
      params.require(:task).permit(:description, :title, :comment)
  end
end
