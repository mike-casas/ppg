class InvitationsController < ApplicationController
    before_action :authenticate_user!

  def new
  @project= Project.find(params[:project])
  end

  def create
    @project=  Project.find(params[:project_id])
    @project.members << User.find_by_email(params[:member_name])
      flash[:notice] = 'Invitado correctamente'

  end

  def destroy
    @project= Project.find(params[:project_id])
    @project.members.delete User.find(params[:user])
    flash[:notice]= 'Eliminado correctamente'
   end
end
