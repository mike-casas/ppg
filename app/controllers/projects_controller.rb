class ProjectsController < ApplicationController
  before_action :authenticate_user!

  layout "Dashboard"
  def index
    @projects=Project.all
    @project= Project.new
  end

  def new
     @project= Project.new
  end

  def create
     @project= Project.create(project_params)

     @project.users << current_user

     redirect_to projects_path
  end

  def edit
    @project= Project.find(params[:id])
  end
  def update
   @project= Project.update(params[:id],project_params)
   redirect_to projects_path
  end

  def destroy
    @project= Project.destroy(params[:id])
  end
 private
   def project_params
     params.require(:project).permit(:name)
   end
end
