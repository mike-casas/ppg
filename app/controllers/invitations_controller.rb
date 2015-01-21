class InvitationsController < ApplicationController
    before_action :authenticate_user!

  def new
  @project= Project.find(params[:project])
  end

  def create
    @project=  Project.find(params[:project_id])
    @guest= User.find_by_email(params[:member_name])
    @project.members << @guest
    @owner_img = Gravatar.new(current_user.email).image_url+"?s=120"
      flash[:notice] = 'Invitado correctamente'

  end

  def destroy
    @project= Project.find(params[:project_id])
    @project.members.delete User.find(params[:user])
    flash[:notice]= 'Eliminado correctamente'
   end
end
