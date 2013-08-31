class ProjectsController < ApplicationController
  def new
  end

  def create
    proj = Project.create name: params[:name], user_id: current_user.id
    if proj.valid?
      redirect_to '/'
    end
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    if @project.update_attributes(name: params[:project][:name])
      flash[:success] = 'Update succeeded'
      redirect_to '/'
    end
  end

  def destroy
    Project.destroy params[:id]
    Task.delete_all project_id: params[:id]
    redirect_to '/'
  end
end
