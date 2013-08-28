class TasksController < ApplicationController
  def create
    task = Task.create name: params[:name], project_id: params[:project_id], is_completed: false
    if task.valid?
      redirect_to '/'
    else
      pp task.errors
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
