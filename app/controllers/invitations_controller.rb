class InvitationsController < ApplicationController
  def new
  @project= Project.find(params[:project])
  end

  def create
    @project=  Project.find(params[:project_id])
    @project.members << User.find_by_email(params[:member_name])


  end

  def destroy

  end
end
