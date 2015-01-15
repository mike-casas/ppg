  require 'fileutils'

class ProjectsController < ApplicationController
  before_action :authenticate_user!

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

     FileUtils.mkdir "storage/#{@project.id.to_s}"


     redirect_to projects_path
  end

  def show
     @project= Project.find(params[:id])
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
    FileUtils.rm_rf "storage/#{@project.id.to_s}"
    redirect_to @project
  end


 private
   def project_params
     params.require(:project).permit(:name)
   end
end
