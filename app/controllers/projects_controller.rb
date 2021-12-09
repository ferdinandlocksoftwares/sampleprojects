class ProjectsController < ApplicationController
  before_action :project_initialize, only: [ :show, :destroy, :update]

  def index
    @projects = Project.all
  end

  def show

  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def new
    @project = Project.new
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      redirect_to @project
    end
  end

  private
    def project_params
      params.require(:project).permit(:description, :title)
    end

    def project_initialize
      @project = Project.find(params[:id])
    end
end
