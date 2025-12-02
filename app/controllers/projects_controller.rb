class ProjectsController < ApplicationController
# before_action :authenticate_user!

  # Home page showing two swimlanes
  def index
    @ongoing_projects = current_user.projects.where(status: "ongoing")
    @finished_projects = current_user.projects.where(status: "finished")
    @footer = true
  end
end

