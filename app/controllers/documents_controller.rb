require 'fileutils'
class DocumentsController < ApplicationController

  def create
      @project= Project.find(params[:project_id])
      @path = "storage/#{params[:project_id]}/#{params[:file_name].to_s}"
     FileUtils.touch @path

     #redirect_to project_path(params[:project_id])
  end

  def show
     @project= Project.find(params[:project_id])
     gon.channel = @project.id

     @parameter= params[:name]
     @content= File.read("#{params[:name]}")
  end

  def update

      File.write("#{params[:parameter]}","#{params[:text]}")
      redirect_to project_path
  end

  def destroy
     FileUtils.rm "#{params[:name]}"
     redirect_to project_path
  end
end
