require 'fileutils'
class DocumentsController < ApplicationController

  def create

     FileUtils.touch "storage/#{params[:project_id]}/#{params[:file_name].to_s}"
     redirect_to project_path(params[:project_id])
  end

  def show

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
